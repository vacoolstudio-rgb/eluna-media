import UIKit
import UniformTypeIdentifiers

/// «Поделиться → Eluna Media» из «Фото», «Файлов» и вообще откуда угодно.
///
/// На Android это делает один intent-filter в манифесте; на iOS лист
/// «Поделиться» умеет отдавать файл только **отдельному бинарнику** —
/// расширению со своим bundle id, своим Info.plist и своей подписью. Поэтому
/// здесь лежит второй target, а не ещё один метод в `AppDelegate`.
///
/// **Как файл попадает в приложение.** Расширение и приложение — разные
/// песочницы, и единственная общая земля у них — App Group. Расширение
/// копирует байты в `SharedInbox` внутри контейнера группы и на этом
/// заканчивает работу; приложение забирает их оттуда при следующем запуске или
/// возвращении на экран (`drainSharedInbox` в `AppDelegate`).
///
/// **Почему расширение не открывает приложение само.** Оно и не может: у
/// расширения нет `UIApplication`, а способ добраться до неё по цепочке
/// респондеров — обход, за который Apple периодически отклоняет. Цена честного
/// пути — один лишний тап пользователя, и она меньше цены отказа на ревью.
///
/// **Почему тип запрашивается родной, а не `public.jpeg`.** Попросив у «Фото»
/// JPEG, получаешь перекодированную копию: снимок HEIC теряет качество ещё до
/// того, как пользователь выбрал формат. Приложение теперь умеет читать HEIC
/// целиком (`StillDecoder`), так что забирать надо оригинал.
///
/// **Интерфейс без единого слова** — намеренно. Приложение переведено на 61
/// язык, а расширение — отдельный бинарник со своими строками; текст здесь
/// означал бы либо 61 перевод ради двух фраз, либо английский поверх японского
/// листа «Поделиться». Кружок ожидания и галочка понятны без перевода.
final class ShareViewController: UIViewController {

  /// Общая земля с приложением. Значение продублировано в `AppDelegate` и в
  /// обоих entitlements — расширение не может импортировать код приложения,
  /// поэтому единственной константы на всех не существует физически.
  private static let appGroupIdentifier = "group.com.eluna.media"
  private static let inboxName = "SharedInbox"

  private let spinner = UIActivityIndicatorView(style: .large)
  private let checkmark = UIImageView(
    image: UIImage(systemName: "checkmark.circle.fill")
  )

  /// `viewDidAppear` зовут и после того, как сверху что-то закрыли.
  private var started = false

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .clear

    let card = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
    card.layer.cornerRadius = 22
    card.layer.cornerCurve = .continuous
    card.clipsToBounds = true
    card.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(card)

    spinner.translatesAutoresizingMaskIntoConstraints = false
    spinner.startAnimating()
    card.contentView.addSubview(spinner)

    checkmark.translatesAutoresizingMaskIntoConstraints = false
    checkmark.tintColor = UIColor(red: 0.55, green: 0.42, blue: 0.93, alpha: 1) // фиолетовый Eluna
    checkmark.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 42, weight: .semibold)
    checkmark.alpha = 0
    card.contentView.addSubview(checkmark)

    NSLayoutConstraint.activate([
      card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      card.widthAnchor.constraint(equalToConstant: 120),
      card.heightAnchor.constraint(equalToConstant: 120),
      spinner.centerXAnchor.constraint(equalTo: card.contentView.centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: card.contentView.centerYAnchor),
      checkmark.centerXAnchor.constraint(equalTo: card.contentView.centerXAnchor),
      checkmark.centerYAnchor.constraint(equalTo: card.contentView.centerYAnchor),
    ])
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    guard !started else { return }
    started = true
    intake()
  }

  // ---------------------------------------------------------------------------

  private func intake() {
    let providers = (extensionContext?.inputItems as? [NSExtensionItem] ?? [])
      .flatMap { $0.attachments ?? [] }

    guard !providers.isEmpty, let inbox = Self.inboxURL() else {
      finish()
      return
    }

    // Копирование идёт параллельно по вложениям, а закрывается лист один раз —
    // отсюда группа. Ролик на гигабайт копируется секунды, и закрыть лист
    // раньше, чем байты дошли, значит потерять их вместе с песочницей.
    let group = DispatchGroup()
    for provider in providers {
      guard let type = Self.fileType(of: provider) else { continue }
      group.enter()
      provider.loadFileRepresentation(forTypeIdentifier: type) { url, _ in
        defer { group.leave() }
        // URL живёт ровно до выхода из этого замыкания — копировать надо здесь
        // и синхронно, а не «потом, на главном потоке».
        guard let url else { return }
        Self.copy(url, into: inbox)
      }
    }
    group.notify(queue: .main) { [weak self] in self?.finish() }
  }

  /// Идентификатор, под которым просить у отправителя файл.
  ///
  /// Берётся первый, который вообще является файлом с данными: у снимка это
  /// `public.heic`, у ролика `public.movie`, у песни `public.mp3`. Именно
  /// родной — см. про перекодирование в шапке класса.
  private static func fileType(of provider: NSItemProvider) -> String? {
    for identifier in provider.registeredTypeIdentifiers {
      guard let type = UTType(identifier) else { continue }
      if type.conforms(to: .image) || type.conforms(to: .movie)
        || type.conforms(to: .audio) || type.conforms(to: .data) {
        return identifier
      }
    }
    return nil
  }

  private static func inboxURL() -> URL? {
    let fm = FileManager.default
    guard
      let container = fm.containerURL(forSecurityApplicationGroupIdentifier: appGroupIdentifier)
    else {
      return nil
    }
    let inbox = container.appendingPathComponent(inboxName, isDirectory: true)
    try? fm.createDirectory(at: inbox, withIntermediateDirectories: true)
    return inbox
  }

  /// Имя сохраняется — пользователь ищет свой файл по нему, а очередь показывает
  /// его в списке. Совпадения разводятся суффиксом, а не перезаписью: два
  /// `IMG_0001.HEIC` из разных альбомов — обычное дело.
  private static func copy(_ url: URL, into inbox: URL) {
    let fm = FileManager.default
    let name = url.lastPathComponent
    var target = inbox.appendingPathComponent(name)
    var suffix = 1
    while fm.fileExists(atPath: target.path) {
      let base = (name as NSString).deletingPathExtension
      let ext = (name as NSString).pathExtension
      let candidate = ext.isEmpty ? "\(base) (\(suffix))" : "\(base) (\(suffix)).\(ext)"
      target = inbox.appendingPathComponent(candidate)
      suffix += 1
    }
    try? fm.copyItem(at: url, to: target)
  }

  private func finish() {
    spinner.stopAnimating()
    UIView.animate(withDuration: 0.18) { self.checkmark.alpha = 1 }
    // Пауза ровно настолько, чтобы галочку успели увидеть.
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) { [weak self] in
      self?.extensionContext?.completeRequest(returningItems: nil)
    }
  }
}
