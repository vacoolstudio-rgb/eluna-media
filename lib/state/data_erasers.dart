import 'package:eluna_shared/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/output_paths.dart';
import '../services/notification_service.dart';
import '../services/share_intake.dart';
import '../services/thumbnails.dart';
import 'queue_controller.dart';

/// Всё, что Media хранит на устройстве, — списком, который стирает
/// «удалить все мои данные».
///
/// Регистрируется в `main` через [ElunaDataWipe.registerAll]; вынесено сюда
/// отдельной функцией ровно затем, чтобы список можно было проверить тестом.
/// Хранилище, которого нет в этом списке, переживёт стирание молча, и узнает об
/// этом первым тот, кто поверил обещанию в политике приватности.
///
/// Чего в списке нет и почему:
///
/// * **Настройки, достижения, `meta.*`, сохранённая очередь.** Всё это лежит в
///   SharedPreferences, а её пакет чистит сам последним шагом. Свой стиратель
///   означал бы второй список ключей — и он разошёлся бы с первым.
/// * **Результаты, сохранённые в галерею.** Файл, который пользователь сам
///   экспортировал наружу, — уже его файл в его галерее, а не данные
///   приложения. Приложение, которое «удаляет свои данные» вместе с чужими
///   фотографиями, — это отзыв на одну звезду, и заслуженный.
/// * **Ключ облачного вольта.** У Media нет ни облака, ни `CloudBackend`.
///
/// Каждое чтение из [container] сидит ВНУТРИ замыкания, а не выполняется при
/// сборке списка: иначе регистрация подняла бы `QueueController` до первого
/// кадра, а он на старте разбирает сохранённую очередь и подметает папку
/// вывода.
List<ElunaEraser> mediaDataErasers({
  required ProviderContainer container,
  required NotificationService notifications,
}) =>
    [
      // Первой: пока идёт пакет, FFmpeg пишет в файлы, которые следующий
      // стиратель собирается удалить. `eraseAll` сначала отменяет пакет.
      ElunaEraser(
        'conversion queue',
        () => container.read(queueProvider.notifier).eraseAll(),
      ),
      // Папка вывода (`Documents/Eluna`): всё сконвертированное живёт внутри
      // песочницы, куда не дотягивается ни один файловый менеджер, — то есть
      // удалить это иначе, чем отсюда, пользователь не может.
      ElunaEraser(
        'converted files',
        () async =>
            ElunaDataWipe.emptyDirectory(await OutputPaths.outputDirectory()),
      ),
      // Кадры предпросмотра в `<temp>/thumbs` — маленькие, но это кадры из
      // видео и фотографий пользователя.
      ElunaEraser(
        'preview thumbnails',
        () => container.read(thumbnailCacheProvider).clear(),
      ),
      // Копии присланных файлов, которые нативная сторона сложила в
      // `<cache>/shared`.
      ElunaEraser('shared file copies', ShareIntake.clearCachedCopies),
      // Показанное уведомление переживает стирание и продолжает рассказывать,
      // сколько файлов было сконвертировано.
      ElunaEraser('notifications', notifications.cancelAll),
    ];
