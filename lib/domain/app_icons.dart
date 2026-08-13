import 'package:eluna_shared/core.dart';

/// Иконки, между которыми можно переключаться.
///
/// Каждая запись существует в четырёх местах сразу, и все четыре обязаны
/// совпадать, иначе рассинхрон виден только на устройстве:
///
///  * `<activity-alias android:name=".Icon…">` в AndroidManifest.xml — ровно
///    один включён, и включение другого и есть смена иконки;
///  * `iconAliases` в MainActivity.kt — белый список, по которому платформа
///    решает, можно ли трогать компонент;
///  * ресурсы `mipmap/ic_launcher_<id>` и `drawable-nodpi/notif_<id>`;
///  * `assets/icons/<id>-512.webp` — превью для экрана выбора.
///
/// Всё, кроме манифеста и белого списка, собирает `tool/gen_app_icons.py` из
/// мастеров в `design/app_icons`.
///
/// Первая в списке — она же по умолчанию: именно она включена в манифесте и
/// стоит в `android:icon` у `<application>`, то есть достаётся тому, кто
/// поставил приложение и ничего не выбирал.
const kAppIcons = <ElunaAppIcon>[
  ElunaAppIcon('loop', 'IconLoop', 'notif_loop'),
  ElunaAppIcon('petals', 'IconPetals', 'notif_petals'),
  ElunaAppIcon('toolbox', 'IconToolbox', 'notif_toolbox'),
  ElunaAppIcon('neon', 'IconNeon', 'notif_neon'),
  ElunaAppIcon('orbit', 'IconOrbit', 'notif_orbit'),
  ElunaAppIcon('unbox', 'IconUnbox', 'notif_unbox'),
  ElunaAppIcon('clamp', 'IconClamp', 'notif_clamp'),
  ElunaAppIcon('envelope', 'IconEnvelope', 'notif_envelope'),
  ElunaAppIcon('satchel', 'IconSatchel', 'notif_satchel'),
];

const kDefaultAppIconId = 'loop';
