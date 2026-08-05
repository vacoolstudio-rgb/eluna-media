// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class L10nPt extends L10n {
  L10nPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Eluna Media';

  @override
  String get tabConvert => 'Converter';

  @override
  String get tabQueue => 'Fila';

  @override
  String get tabAbout => 'Sobre';

  @override
  String get addFiles => 'Adicionar arquivos';

  @override
  String get emptySelectionTitle => 'Nenhum arquivo ainda';

  @override
  String get emptySelectionBody =>
      'Adicione fotos, vídeos ou áudios. Tudo é processado neste dispositivo.';

  @override
  String get sectionOutput => 'Saída';

  @override
  String get sectionVideo => 'Vídeo';

  @override
  String get sectionAudio => 'Áudio';

  @override
  String get sectionImage => 'Imagem';

  @override
  String get sectionPrivacy => 'Privacidade';

  @override
  String get outputFormat => 'Formato';

  @override
  String get videoCodec => 'Codec de vídeo';

  @override
  String get audioCodec => 'Codec de áudio';

  @override
  String get rateControl => 'Controle de taxa';

  @override
  String get rateControlQuality => 'Qualidade constante (CRF)';

  @override
  String get rateControlBitrate => 'Bitrate alvo';

  @override
  String crfLabel(int value) {
    return 'Qualidade (CRF $value)';
  }

  @override
  String get crfHint => 'Quanto menor, melhor a qualidade e maior o arquivo.';

  @override
  String videoBitrate(int value) {
    return 'Bitrate de vídeo: $value kbps';
  }

  @override
  String audioBitrate(int value) {
    return 'Bitrate de áudio: $value kbps';
  }

  @override
  String get encodingPreset => 'Preset do codificador';

  @override
  String get encodingPresetHint =>
      'Presets mais lentos comprimem melhor, mas esquentam mais o dispositivo.';

  @override
  String get presetOriginal => 'Original';

  @override
  String get resolution => 'Resolução';

  @override
  String get frameRate => 'Taxa de quadros';

  @override
  String imageQuality(int value) {
    return 'Qualidade: $value';
  }

  @override
  String get lossless => 'Sem perdas';

  @override
  String get losslessHint =>
      'Arquivos maiores, resultado perfeito pixel a pixel.';

  @override
  String get sectionEnhance => 'Melhoria';

  @override
  String get sharpenLabel => 'Nitidez';

  @override
  String get sharpenHint =>
      'Deixa as bordas mais definidas. Não recupera uma foto tremida ou fora de foco — esse detalhe não está no arquivo.';

  @override
  String get sharpenStrongHint =>
      'Nitidez forte pode deixar halos claros nas bordas. Comece pelo “Médio”.';

  @override
  String get denoiseLabel => 'Redução de ruído';

  @override
  String get denoiseHint =>
      'Limpa o granulado das fotos escuras e noturnas. Em excesso, borra os detalhes finos.';

  @override
  String get autoColorLabel => 'Cor e níveis automáticos';

  @override
  String get autoColorHint =>
      'Estica o contraste e dá um pouco de vida às cores apagadas.';

  @override
  String get upscaleLabel => 'Ampliar 2×';

  @override
  String get upscaleHint =>
      'Dobra a largura e a altura. Não acrescenta detalhe — ajuda na hora de imprimir ou recortar.';

  @override
  String get upscaleConflictHint =>
      'Para ampliar, coloque a “Resolução” de volta em “Original”.';

  @override
  String get upscaleChip => '2×';

  @override
  String get enhanceOff => 'Desligado';

  @override
  String get enhanceLight => 'Leve';

  @override
  String get enhanceMedium => 'Médio';

  @override
  String get enhanceStrong => 'Forte';

  @override
  String get stripMetadata => 'Remover metadados';

  @override
  String get stripMetadataHint => 'Remove EXIF, GPS e datas do resultado.';

  @override
  String startConversion(int count) {
    return 'Converter $count arquivos';
  }

  @override
  String get batchResumed => 'Conversão interrompida retomada.';

  @override
  String get converting => 'Convertendo…';

  @override
  String get cancelBatch => 'Parar';

  @override
  String get cancelJob => 'Cancelar';

  @override
  String get clearFinished => 'Limpar concluídos';

  @override
  String get removeJob => 'Remover';

  @override
  String get shareFile => 'Compartilhar';

  @override
  String get retryJob => 'Tentar de novo';

  @override
  String get queueEmptyTitle => 'A fila está vazia';

  @override
  String get queueEmptyBody =>
      'Os arquivos adicionados na aba Converter aparecem aqui.';

  @override
  String queueActiveTab(int count) {
    return 'Ativos · $count';
  }

  @override
  String queueFinishedTab(int count) {
    return 'Concluídos · $count';
  }

  @override
  String get queueNoActiveTitle => 'Nada em andamento';

  @override
  String get queueNoActiveBody =>
      'Os arquivos na espera ou em conversão aparecem aqui.';

  @override
  String get queueNoFinishedTitle => 'Nada concluído ainda';

  @override
  String get queueNoFinishedBody =>
      'Os arquivos convertidos chegam aqui, prontos para abrir, salvar ou compartilhar.';

  @override
  String get statusQueued => 'Na fila';

  @override
  String get statusRunning => 'Convertendo';

  @override
  String get statusCompleted => 'Concluído';

  @override
  String get statusFailed => 'Falhou';

  @override
  String get statusCancelled => 'Cancelado';

  @override
  String batchSummary(int done, int total) {
    return '$done de $total concluídos';
  }

  @override
  String batchCompleted(int done) {
    String _temp0 = intl.Intl.pluralLogic(
      done,
      locale: localeName,
      other: '$done arquivos convertidos',
      one: '$done arquivo convertido',
    );
    return '$_temp0';
  }

  @override
  String batchCompletedWithFailures(int done, int failed) {
    return '$done convertidos, $failed com falha.';
  }

  @override
  String savedPercent(int percent) {
    return '$percent% menor';
  }

  @override
  String grewPercent(int percent) {
    return '$percent% maior';
  }

  @override
  String sizeChange(String from, String to) {
    return '$from → $to';
  }

  @override
  String get appearance => 'Aparência';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get privacyTitle => 'Privacidade';

  @override
  String get privacyBody =>
      'O Eluna Media converte seus arquivos inteiramente neste dispositivo, usando uma cópia embutida do FFmpeg. Seus arquivos nunca saem do dispositivo, nenhuma conta é necessária e não há telemetria. Nada no app usa a rede — ele nem sequer tem a permissão de internet.\n\nA remoção de metadados vem ativada por padrão, então EXIF, coordenadas de GPS e datas ficam de fora dos arquivos que você exporta.';

  @override
  String get licenseTitle => 'Licença';

  @override
  String get licenseBody =>
      'Este app inclui o FFmpeg compilado com x264, x265 e outros componentes GPL, por isso o aplicativo como um todo é distribuído sob a GNU GPL v3.';

  @override
  String get formatUnsupportedForSource =>
      'Este formato não comporta o codec selecionado.';

  @override
  String get sourceMissing => 'O arquivo de origem não está mais disponível.';

  @override
  String get errorTitle => 'Falha na conversão';

  @override
  String get tabSettings => 'Configurações';

  @override
  String get introTitle => 'Privado por design';

  @override
  String get introOfflineTitle => 'Converte neste dispositivo';

  @override
  String get introOfflineBody =>
      'Uma cópia embutida do FFmpeg faz todo o trabalho. Seus arquivos nunca saem do telefone — a conversão funciona até no modo avião.';

  @override
  String get introTelemetryTitle => 'Zero telemetria';

  @override
  String get introTelemetryBody =>
      'Sem conta, sem análises, sem relatórios de falhas. O app não sabe quem você é.';

  @override
  String get introMetadataTitle => 'Metadados sob controle';

  @override
  String get introMetadataBody =>
      'EXIF, GPS e datas são removidos de todos os resultados por padrão. Você pode desativar isso.';

  @override
  String get introFreeNote =>
      'Gratuito: sem anúncios, sem assinaturas e sem compras no app. Todos os recursos, incluindo conversão em lote, já estão aqui.';

  @override
  String get introContinue => 'Começar';

  @override
  String get modeSimple => 'Simples';

  @override
  String get modeAdvanced => 'Avançado';

  @override
  String get modeAdvancedHint =>
      'Mostra todos os controles de codec, bitrate e transformação no lugar dos cartões de preset.';

  @override
  String get presetCompressVideoTitle => 'Comprimir vídeo';

  @override
  String get presetCompressVideoBody =>
      'MP4 muito menor, qualidade continua boa';

  @override
  String get presetFitToSizeTitle => 'Ajustar ao tamanho';

  @override
  String get presetFitToSizeBody =>
      'Atinja um limite exato — Discord, e-mail, chats';

  @override
  String get presetCompatibleMp4Title => 'MP4 compatível';

  @override
  String get presetCompatibleMp4Body =>
      'H.264 + AAC. Reproduz em qualquer lugar';

  @override
  String get presetExtractAudioTitle => 'Extrair áudio';

  @override
  String get presetExtractAudioBody => 'MP3 de qualquer vídeo';

  @override
  String get presetVideoToGifTitle => 'Vídeo em GIF';

  @override
  String get presetVideoToGifBody => 'Clipe curto em GIF animado';

  @override
  String get presetMergeTitle => 'Juntar vídeos';

  @override
  String get presetMergeBody => 'Una clipes em um só MP4, na ordem';

  @override
  String get mergeNeedsTwo => 'Selecione pelo menos dois vídeos para juntar.';

  @override
  String mergedVideoName(int count) {
    return 'Vídeo unido ($count clipes).mp4';
  }

  @override
  String get presetCompressImageTitle => 'Comprimir foto';

  @override
  String get presetCompressImageBody => 'JPEG menor, perda quase invisível';

  @override
  String get presetEnhancePhotoTitle => 'Melhorar foto';

  @override
  String get presetEnhancePhotoBody =>
      'Mais limpa, mais nítida, cores melhores';

  @override
  String get presetImageToWebpTitle => 'Foto em WebP';

  @override
  String get presetImageToWebpBody => 'Formato moderno, menor que JPEG';

  @override
  String get sizeTargetTitle => 'Tamanho alvo';

  @override
  String sizeTargetMb(int mb) {
    return '$mb MB';
  }

  @override
  String sizeTargetNamed(String service, int mb) {
    return '$service · $mb MB';
  }

  @override
  String get sizeTargetCustom => 'Personalizado…';

  @override
  String get sizeTargetDialogTitle => 'Tamanho alvo em MB';

  @override
  String get sizeTargetTooSmall =>
      'O alvo é pequeno demais para essa duração; será usada a qualidade mais próxima possível.';

  @override
  String estimatePerFile(String size) {
    return '≈ $size por arquivo';
  }

  @override
  String estimateTotal(String size) {
    return 'Saída estimada: ≈ $size';
  }

  @override
  String selectedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos selecionados',
      one: '$count arquivo selecionado',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Limpar';

  @override
  String get presetExpectsVideo => 'Este preset espera arquivos de vídeo.';

  @override
  String get presetExpectsImage => 'Este preset espera imagens.';

  @override
  String get promiseOffline => 'Conversão 100% offline';

  @override
  String get promiseBatchFree => 'Lote é grátis';

  @override
  String get promiseNoWatermark => 'Sem marca d\'água';

  @override
  String get sectionTransform => 'Transformar';

  @override
  String get rotateLabel => 'Girar';

  @override
  String get flipLabel => 'Espelhar horizontalmente';

  @override
  String get speedLabel => 'Velocidade';

  @override
  String get cropLabel => 'Recortar';

  @override
  String get cropHint =>
      'Recorte centralizado na proporção escolhida — quadrado para o feed, 9:16 para stories.';

  @override
  String volumeLabel(int percent) {
    return 'Volume: $percent%';
  }

  @override
  String get addAudioFiles => 'Áudio e outros arquivos';

  @override
  String get hwEncoderLabel => 'Codificação por hardware';

  @override
  String get hwEncoderHint =>
      'Usa o chip de vídeo do dispositivo nos modos de bitrate e de tamanho alvo — muito mais rápido e frio. O modo de qualidade (CRF) sempre usa o codificador por software, mais preciso, e uma tarefa de hardware que falhar é refeita por software automaticamente.';

  @override
  String get transformNeedsReencode =>
      'Girar, espelhar e mudar a velocidade exigem recodificação, então ficam desativados na cópia de stream.';

  @override
  String get capBitrateLabel => 'Nunca deixar o arquivo maior';

  @override
  String get capBitrateHint =>
      'Limita a codificação ao bitrate do próprio arquivo de origem. A qualidade constante não tem teto próprio, então um vídeo já comprimido pode acabar ficando maior.';

  @override
  String get keepSubtitles => 'Manter legendas';

  @override
  String get keepSubtitlesHint =>
      'Leva as trilhas de legenda para o resultado. Apenas legendas de texto.';

  @override
  String get sectionTrim => 'Cortar';

  @override
  String get trimEnable => 'Cortar por tempo';

  @override
  String get trimHint =>
      'Disponível quando há exatamente um arquivo na fila com duração conhecida.';

  @override
  String trimRangeLabel(String from, String to) {
    return '$from – $to';
  }

  @override
  String get rateControlSize => 'Tamanho alvo';

  @override
  String get lowBatteryTitle => 'Bateria fraca';

  @override
  String get lowBatteryBody =>
      'A conversão exige muito do processador. Você pode conectar o carregador antes, ou continuar mesmo assim.';

  @override
  String get lowBatteryContinue => 'Converter mesmo assim';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonOk => 'OK';

  @override
  String filesReceived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos recebidos',
      one: '$count arquivo recebido',
    );
    return '$_temp0';
  }

  @override
  String get saveFile => 'Salvar';

  @override
  String get savedToGallery => 'Salvo na galeria, no álbum “Eluna Media”.';

  @override
  String get savedToDownloads => 'Salvo em Downloads.';

  @override
  String get saveFailed => 'Não foi possível salvar o arquivo.';

  @override
  String get jobRemovedUndo => 'Tarefa removida.';

  @override
  String get finishedClearedUndo => 'Tarefas concluídas removidas.';

  @override
  String get undo => 'Desfazer';

  @override
  String get errorDetailsTitle => 'Detalhes do erro';

  @override
  String get oledDark => 'Tema escuro preto puro';

  @override
  String get oledDarkHint =>
      'O preto verdadeiro economiza energia em telas OLED.';

  @override
  String get dynamicColorLabel => 'Cores do sistema (Material You)';

  @override
  String get dynamicColorHint =>
      'Segue a paleta do papel de parede onde houver suporte.';

  @override
  String get sectionConversionPrefs => 'Conversão';

  @override
  String get powerModeLabel => 'Modo de energia';

  @override
  String get powerEfficiency => 'Frio e rápido';

  @override
  String get powerBalanced => 'Equilibrado';

  @override
  String get powerQuality => 'Compressão máxima';

  @override
  String get powerModeHint =>
      'O quanto o codificador de vídeo se esforça. Mais frio e rápido significa arquivos um pouco maiores. Nada mais é limitado — nunca.';

  @override
  String get hapticsLabel => 'Vibração';

  @override
  String get networkPrivacyTitle => 'Rede e privacidade';

  @override
  String get netAuditIntro =>
      'Uma lista completa de tudo neste app que pode acessar a rede.';

  @override
  String get netAuditNoneTitle => 'Nenhum acesso à rede';

  @override
  String get netAuditNoneBody =>
      'O app não pede a permissão de internet, então não consegue alcançar a rede nem se quisesse — dá para conferir nas informações do sistema. Sem anúncios, sem análises, sem verificação de atualizações. “Avaliar o app” passa a bola para a loja, que se conecta sozinha.';

  @override
  String get netAuditConversionTitle => 'Conversão';

  @override
  String get netAuditConversionBody =>
      'Roda inteiramente neste dispositivo com um FFmpeg embutido. Ative o modo avião e converta — funciona.';

  @override
  String get netAuditTelemetryTitle => 'Telemetria';

  @override
  String get netAuditTelemetryBody =>
      'Não existe. O app não coleta análises, nem relatórios de falhas, nem identificadores, e não tem sistema de contas.';

  @override
  String get sectionSupport => 'Apoio';

  @override
  String get rateApp => 'Avaliar o app';

  @override
  String get openLicenses => 'Licenças de código aberto';

  @override
  String get errorFallbackTitle => 'Algo deu errado';

  @override
  String get errorFallbackBody =>
      'O app encontrou um erro inesperado. Sua fila e suas configurações estão a salvo — volte e tente de novo.';

  @override
  String get presetAudioToMp3Title => 'Converter áudio';

  @override
  String get presetAudioToMp3Body => 'Para MP3 — toca em qualquer lugar';

  @override
  String get presetCompressAudioTitle => 'Comprimir áudio';

  @override
  String get presetCompressAudioBody =>
      'AAC mais leve — notas de voz, podcasts';

  @override
  String get convertTo => 'Converter para';

  @override
  String get formatRecommended => 'Recomendado';

  @override
  String get formatSectionHint =>
      'Aqui só aparecem os formatos em que seus arquivos realmente podem ser convertidos.';

  @override
  String get sourceVideo => 'Vídeo';

  @override
  String get sourceImage => 'Foto';

  @override
  String get sourceAudio => 'Áudio';

  @override
  String get sourceUnknown => 'Arquivo';

  @override
  String get mixedSelectionTitle =>
      'Você selecionou tipos de arquivo diferentes';

  @override
  String get mixedSelectionBody =>
      'Cada arquivo é convertido com o preset melhor para o tipo dele. Adicione um tipo por vez se quiser controle total.';

  @override
  String get filesTitle => 'Arquivos';

  @override
  String get removeFile => 'Remover';

  @override
  String get unknownDuration => '—';

  @override
  String percentDone(int percent) {
    return '$percent%';
  }

  @override
  String timeLeft(String time) {
    return '≈ $time restantes';
  }

  @override
  String get jobSettingsTitle => 'Configurações de conversão';

  @override
  String get jobDetails => 'Detalhes';

  @override
  String summaryQuality(int value) {
    return 'CRF $value';
  }

  @override
  String summaryBitrate(int value) {
    return '$value kbps';
  }

  @override
  String summaryTargetSize(String size) {
    return '≤ $size';
  }

  @override
  String get summaryTwoPass => 'Duas passagens';

  @override
  String get summaryEnhanced => 'Melhorada';

  @override
  String get summaryMetadataStripped => 'Metadados removidos';

  @override
  String summaryMerge(int count) {
    return '$count clipes unidos';
  }

  @override
  String get rateDialogTitle => 'Curtindo o Eluna Media?';

  @override
  String get rateDialogBody =>
      'Toque em uma estrela. Sua avaliação fica entre você e a loja.';

  @override
  String get rateDialogLater => 'Agora não';

  @override
  String get rateFeedbackTitle => 'O que dá para melhorar?';

  @override
  String get rateFeedbackBody =>
      'Conte o que deu errado e a gente conserta. Sem conta, sem rastreamento — só um e-mail que você mesmo escreve.';

  @override
  String get rateSendFeedback => 'Escrever feedback';

  @override
  String get rateThanks => 'Obrigado!';

  @override
  String feedbackSubject(int stars) {
    return 'Feedback do Eluna Media ($stars/5)';
  }

  @override
  String get noEmailApp =>
      'Nenhum app de e-mail está configurado neste dispositivo.';

  @override
  String get shareApp => 'Compartilhar o app';

  @override
  String get shareAppText =>
      'Eluna Media — um conversor gratuito de fotos, vídeos e áudio, totalmente offline. Sem assinaturas, sem marcas d\'água, sem contas.';

  @override
  String appVersionLabel(String version) {
    return 'Versão $version';
  }

  @override
  String get openFile => 'Abrir';

  @override
  String get openFolder => 'Mostrar pasta';

  @override
  String get noAppToOpen =>
      'Nenhum app deste dispositivo consegue abrir esse arquivo.';

  @override
  String get openFailed => 'Não foi possível abrir o arquivo.';

  @override
  String get twoPassLabel => 'Duas passagens para tamanho exato';

  @override
  String get twoPassHint =>
      'Tarefas de ajuste ao tamanho codificam duas vezes e acertam o limite de bytes com bem mais precisão — por cerca do dobro do tempo e da bateria.';

  @override
  String get whatsNewTitle => 'Novidades';

  @override
  String get whatsNew1 =>
      'Os arquivos prontos vão direto para a galeria, e “Salvar tudo” leva o lote inteiro de uma vez.';

  @override
  String get whatsNew2 =>
      'Ajuste a foto a um tamanho exato — de 100 KB a 2 MB, ou o número que você digitar.';

  @override
  String get whatsNew3 =>
      'O app não acumula mais gigabytes: os ajustes mostram o espaço ocupado e o liberam.';

  @override
  String get whatsNew4 =>
      'Pare uma conversão pela notificação e receba um aviso antes de o espaço acabar.';

  @override
  String get whatsNew5 =>
      'Miniaturas, comparação antes/depois, GIF → MP4, tempos de corte exatos — e as fotos são processadas várias de cada vez.';

  @override
  String get achievementsTitle => 'Conquistas';

  @override
  String achievementsProgress(int done, int total) {
    return '$done de $total';
  }

  @override
  String achievementUnlocked(String title) {
    return 'Conquista desbloqueada: $title';
  }

  @override
  String get achievementsPrivacyNote =>
      'Contadas só neste dispositivo. Nada é enviado a lugar nenhum.';

  @override
  String get achFirstConversionTitle => 'Primeiros passos';

  @override
  String get achFirstConversionBody => 'Converta seu primeiro arquivo.';

  @override
  String get achTenConversionsTitle => 'Aquecendo';

  @override
  String get achTenConversionsBody => 'Converta 10 arquivos.';

  @override
  String get achFiftyConversionsTitle => 'Freguês';

  @override
  String get achFiftyConversionsBody => 'Converta 50 arquivos.';

  @override
  String get achTwoHundredConversionsTitle => 'Máquina de trabalho';

  @override
  String get achTwoHundredConversionsBody => 'Converta 200 arquivos.';

  @override
  String get achThousandConversionsTitle => 'Esteira';

  @override
  String get achThousandConversionsBody => 'Converta 1000 arquivos.';

  @override
  String get achSaved100MbTitle => 'Poupa-espaço';

  @override
  String get achSaved100MbBody => 'Libere 100 MB no total.';

  @override
  String get achSaved1GbTitle => 'Caçador de gigabytes';

  @override
  String get achSaved1GbBody => 'Libere 1 GB no total.';

  @override
  String get achSaved10GbTitle => 'Herói do armazenamento';

  @override
  String get achSaved10GbBody => 'Libere 10 GB no total.';

  @override
  String get achBatchOfFiveTitle => 'Trabalho em lote';

  @override
  String get achBatchOfFiveBody => 'Conclua um lote de 5 arquivos ou mais.';

  @override
  String get achBatchOfTwentyTitle => 'Linha de montagem';

  @override
  String get achBatchOfTwentyBody => 'Conclua um lote de 20 arquivos ou mais.';

  @override
  String get achSniperTitle => 'Na mosca';

  @override
  String get achSniperBody =>
      'Acerte um tamanho exato com o ajuste ao tamanho.';

  @override
  String get achMemeSmithTitle => 'Memeiro';

  @override
  String get achMemeSmithBody => 'Transforme um vídeo em GIF.';

  @override
  String get achSoundHunterTitle => 'Caçador de som';

  @override
  String get achSoundHunterBody => 'Extraia o áudio de um vídeo.';

  @override
  String get achSubtitleKeeperTitle => 'Guardião das legendas';

  @override
  String get achSubtitleKeeperBody => 'Converta um vídeo mantendo as legendas.';

  @override
  String get achDirectorTitle => 'Diretor';

  @override
  String get achDirectorBody =>
      'Aplique uma transformação — girar, recortar, velocidade ou volume.';

  @override
  String get achAllRounderTitle => 'Faz-tudo';

  @override
  String get achAllRounderBody => 'Converta vídeo, áudio e imagem.';

  @override
  String get achNightOwlTitle => 'Coruja';

  @override
  String get achNightOwlBody =>
      'Conclua uma conversão entre meia-noite e 5 da manhã.';

  @override
  String get achPlatinumTitle => 'Platina';

  @override
  String get achPlatinumBody => 'Desbloqueie todas as outras conquistas.';

  @override
  String get storageTitle => 'Armazenamento';

  @override
  String get storageBody =>
      'Os arquivos convertidos ficam dentro do app até você salvar ou compartilhar; nenhum gerenciador de arquivos os alcança.';

  @override
  String get storageEmpty => 'Nada armazenado';

  @override
  String storageUsage(String size) {
    return 'Ocupado: $size';
  }

  @override
  String get storageClearTitle => 'Limpar os arquivos armazenados?';

  @override
  String get storageClearBody =>
      'Exclui todos os resultados concluídos que o app ainda guarda. Arquivos já salvos ou compartilhados não são afetados.';

  @override
  String get storageClearAction => 'Limpar';

  @override
  String storageCleared(String size) {
    return '$size liberados';
  }

  @override
  String get autoSaveLabel => 'Salvar os resultados automaticamente';

  @override
  String get autoSaveHint =>
      'Coloca cada arquivo pronto na galeria — áudio em Downloads — assim que fica pronto.';

  @override
  String get lowSpaceTitle => 'Pouco espaço livre';

  @override
  String lowSpaceBody(String needed, String free) {
    return 'Este lote precisa de cerca de $needed e só há $free livres. A conversão pode parar no meio.';
  }

  @override
  String saveAll(int count) {
    return 'Salvar tudo ($count)';
  }

  @override
  String savedAll(int count) {
    return 'Salvos: $count';
  }

  @override
  String savedSome(int saved, int total) {
    return '$saved de $total salvos';
  }

  @override
  String get presetFitPhotoTitle => 'Foto no tamanho exato';

  @override
  String get presetFitPhotoBody =>
      'Comprime a imagem abaixo de um limite exato — formulários de envio, inscrições.';

  @override
  String get photoFitHint =>
      'O app testa qualidades até uma caber. Se o limite for pequeno demais, ele também reduz o tamanho da imagem.';

  @override
  String sizeTargetKb(int kb) {
    return '$kb KB';
  }

  @override
  String get sizeTargetDialogTitleKb => 'Tamanho alvo em KB';

  @override
  String get compareAction => 'Comparar';

  @override
  String get compareBefore => 'Antes';

  @override
  String get compareAfter => 'Depois';

  @override
  String get compareHint => 'Toque e segure para ver o original.';

  @override
  String get trimStart => 'Início';

  @override
  String get trimEnd => 'Fim';

  @override
  String trimTimeHelp(String duration) {
    return 'm:ss, até $duration';
  }

  @override
  String get imageScaleLabel => 'Escala';

  @override
  String get audioChannelsLabel => 'Canais';

  @override
  String get audioMono => 'Mono';

  @override
  String get audioStereo => 'Estéreo';

  @override
  String get sampleRateLabel => 'Taxa de amostragem';

  @override
  String get voiceAudioHint =>
      'Mono a 22,05 kHz reduz uma gravação de voz a cerca de um quarto sem perda audível. Para música, deixe ambos no original.';

  @override
  String get moveUp => 'Mover para cima';

  @override
  String get moveDown => 'Mover para baixo';

  @override
  String get renameOutput => 'Renomear resultado';

  @override
  String get renameOutputHint => 'Novo nome';

  @override
  String get renameOutputHelp =>
      'A extensão vem do formato de saída. Deixe em branco para o resultado herdar o nome do arquivo original.';

  @override
  String deleteOriginalsAction(int count) {
    return 'Excluir originais ($count)';
  }

  @override
  String get deleteOriginalsAuto => 'Excluir os originais depois de converter';

  @override
  String get deleteOriginalsHint =>
      'Pede ao sistema para remover os arquivos de origem depois que o resultado for salvo. O sistema sempre mostra o que vai sumir e espera sua confirmação.';

  @override
  String originalsDeleted(String size) {
    return 'Originais excluídos — $size liberados';
  }

  @override
  String get originalsNoneDeleted =>
      'Nada foi excluído. Só dá para encontrar os arquivos que a galeria ainda guarda com o nome original.';

  @override
  String reclaimedTotal(String size) {
    return 'Liberado com este app: $size';
  }
}
