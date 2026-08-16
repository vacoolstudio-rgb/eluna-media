#!/usr/bin/env node
/* ─── upload_aso.js ───────────────────────────────────────────────────────────
 * Заливает листинг App Store на всех локалях.
 *
 *   node tool/upload_aso.js <appId> [--dry]
 *
 * Поля лежат в ДВУХ разных ресурсах, и это первое, на чём тут спотыкаются:
 *   • имя и подзаголовок      → appInfoLocalizations   (раздел «App Information»)
 *   • описание, ключевые слова,
 *     промо и «что нового»    → appStoreVersionLocalizations
 * Попытка отправить `name` вместе с `description` кончается 409 без объяснений.
 *
 * Длины Apple режет молча, поэтому скрипт проверяет их сам и отказывается
 * заливать, если хоть одно поле не влезло: обрезанное на 40-й локали имя
 * находится потом только глазами.
 * ───────────────────────────────────────────────────────────────────────────── */
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const KEY_ID = process.env.ASC_KEY_ID;
const ISSUER = process.env.ASC_ISSUER_ID;
if (!KEY_ID || !ISSUER) {
  console.error('Нужны ASC_KEY_ID и ASC_ISSUER_ID.');
  process.exit(2);
}
const KEY = fs.readFileSync(
  path.join(process.env.HOME, '.appstoreconnect', 'private_keys', `AuthKey_${KEY_ID}.p8`), 'utf8');
const API = 'https://api.appstoreconnect.apple.com';

const b64 = (b) => Buffer.from(b).toString('base64')
  .replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '');
function token() {
  const now = Math.floor(Date.now() / 1000);
  const h = b64(JSON.stringify({ alg: 'ES256', kid: KEY_ID, typ: 'JWT' }));
  const p = b64(JSON.stringify({ iss: ISSUER, iat: now, exp: now + 1200, aud: 'appstoreconnect-v1' }));
  const sig = crypto.sign('sha256', Buffer.from(`${h}.${p}`), { key: KEY, dsaEncoding: 'ieee-p1363' });
  return `${h}.${p}.${b64(sig)}`;
}
async function api(method, p, body) {
  const r = await fetch(API + p, {
    method,
    headers: { Authorization: `Bearer ${token()}`, ...(body ? { 'Content-Type': 'application/json' } : {}) },
    ...(body ? { body: JSON.stringify(body) } : {}),
  });
  const t = await r.text();
  if (!r.ok) throw new Error(`${method} ${p} → ${r.status}\n${t.slice(0, 400)}`);
  return t ? JSON.parse(t) : null;
}


/**
 * Создать или обновить локализацию.
 *
 * Карта «локаль → id» строится один раз, а Apple успевает завести локали и
 * сама (при создании записи приложения, например). Поэтому на ответ
 * «уже существует» карта перечитывается и запись обновляется, а не роняет
 * прогон на тридцатой локали из пятидесяти.
 */
async function upsert({ type, listPath, parentRel, parent, locale, attrs, cache }) {
  const id = cache.get(locale);
  if (id) {
    await api('PATCH', `/v1/${type}/${id}`, { data: { type, id, attributes: attrs } });
    return;
  }
  try {
    await api('POST', `/v1/${type}`, {
      data: { type, attributes: { locale, ...attrs }, relationships: { [parentRel]: { data: parent } } },
    });
  } catch (e) {
    if (!/DUPLICATE|already exists/i.test(e.message)) throw e;
    const fresh = await api('GET', `${listPath}?limit=200`);
    for (const x of fresh.data) cache.set(x.attributes.locale, x.id);
    const found = cache.get(locale);
    if (!found) throw e;
    await api('PATCH', `/v1/${type}/${found}`, { data: { type, id: found, attributes: attrs } });
  }
}

const DOCS = path.join(__dirname, '..', 'docs', 'ASO');
const base = JSON.parse(fs.readFileSync(path.join(DOCS, 'base_en.json'), 'utf8'));

/** Английские витрины отличаются только орфографией, которой в тексте нет. */
const listing = { 'en-US': base, 'en-GB': base, 'en-AU': base, 'en-CA': base };
for (const f of ['locales_a.json', 'locales_b.json', 'locales_c.json', 'locales_d.json']) {
  Object.assign(listing, JSON.parse(fs.readFileSync(path.join(DOCS, f), 'utf8')));
}

const LIMITS = { name: 30, subtitle: 30, keywords: 100, promotionalText: 170, description: 4000, whatsNew: 4000 };

function validate() {
  const bad = [];
  for (const [loc, v] of Object.entries(listing)) {
    for (const [field, limit] of Object.entries(LIMITS)) {
      const value = v[field];
      if (!value) { bad.push(`${loc}: нет поля ${field}`); continue; }
      if ([...value].length > limit) bad.push(`${loc}.${field}: ${[...value].length} > ${limit}`);
    }
  }
  return bad;
}

(async () => {
  const [appId, ...rest] = process.argv.slice(2);
  const dry = rest.includes('--dry');
  if (!appId) { console.error('usage: upload_aso.js <appId> [--dry]'); process.exit(2); }

  const bad = validate();
  console.log(`локалей: ${Object.keys(listing).length}`);
  if (bad.length) {
    console.error('НЕ ВЛЕЗАЕТ:\n  ' + bad.join('\n  '));
    process.exit(1);
  }
  console.log('длины в порядке');
  if (dry) { console.log('проба — ничего не отправлено'); return; }

  // Куда писать имя и подзаголовок.
  const infos = await api('GET', `/v1/apps/${appId}/appInfos?limit=10`);
  const editable = infos.data.find((i) =>
    ['PREPARE_FOR_SUBMISSION', 'DEVELOPER_REJECTED', 'REJECTED', 'METADATA_REJECTED']
      .includes(i.attributes.appStoreState)) || infos.data[0];
  const infoLocs = await api('GET', `/v1/appInfos/${editable.id}/appInfoLocalizations?limit=200`);
  const infoByLocale = new Map(infoLocs.data.map((x) => [x.attributes.locale, x.id]));

  // Куда писать описание и ключевые слова.
  const versions = await api('GET', `/v1/apps/${appId}/appStoreVersions?limit=10`);
  const version = versions.data.find((v) =>
    ['PREPARE_FOR_SUBMISSION', 'DEVELOPER_REJECTED', 'REJECTED', 'METADATA_REJECTED']
      .includes(v.attributes.appStoreState)) || versions.data[0];
  const verLocs = await api('GET', `/v1/appStoreVersions/${version.id}/appStoreVersionLocalizations?limit=200`);
  const verByLocale = new Map(verLocs.data.map((x) => [x.attributes.locale, x.id]));

  // «Что нового» у ПЕРВОГО выпуска не бывает: нового относительно чего? Apple
  // отвечает на попытку 409 «cannot be edited at this time», и это не ошибка
  // прав, а сообщение о том, что поля тут просто нет.
  const released = versions.data.some((v) =>
    ['READY_FOR_SALE', 'PENDING_DEVELOPER_RELEASE', 'PROCESSING_FOR_APP_STORE', 'IN_REVIEW']
      .includes(v.attributes.appStoreState));
  const firstRelease = !released;

  console.log(`версия ${version.attributes.versionString}, локалей уже заведено: ${verByLocale.size}` +
    (firstRelease ? ' · первый выпуск, «что нового» пропускается' : ''));

  let done = 0;
  for (const [locale, v] of Object.entries(listing)) {
    // 1. Имя и подзаголовок.
    await upsert({
      type: 'appInfoLocalizations',
      listPath: `/v1/appInfos/${editable.id}/appInfoLocalizations`,
      parentRel: 'appInfo',
      parent: { type: 'appInfos', id: editable.id },
      locale,
      attrs: { name: v.name, subtitle: v.subtitle },
      cache: infoByLocale,
    });

    // 2. Описание, ключевые слова, промо, «что нового».
    const verAttrs = {
      description: v.description,
      keywords: v.keywords,
      promotionalText: v.promotionalText,
      ...(firstRelease ? {} : { whatsNew: v.whatsNew }),
      supportUrl: 'https://eluna-apps.com',
      marketingUrl: 'https://eluna-apps.com',
    };
    await upsert({
      type: 'appStoreVersionLocalizations',
      listPath: `/v1/appStoreVersions/${version.id}/appStoreVersionLocalizations`,
      parentRel: 'appStoreVersion',
      parent: { type: 'appStoreVersions', id: version.id },
      locale,
      attrs: verAttrs,
      cache: verByLocale,
    });

    done++;
    console.log(`  ${locale} — готово (${done}/${Object.keys(listing).length})`);
  }
  console.log('\n✅ листинг залит');
})().catch((e) => { console.error('\n✖ ' + e.message); process.exit(1); });
