import 'package:console_chat_app/service/language_service.dart';

import '../data/locale/enEN.dart';
import '../data/locale/ruRU.dart';
import '../data/locale/uzUZ.dart';

extension LanguageExtension on String {
  String get tr {
    switch(LanguageService.getLanguage){
      case Language.uz: return uz[this] ?? this;
      case Language.ru: return ru[this] ?? this;
      case Language.en: return en[this] ?? this;
    }
  }
}
