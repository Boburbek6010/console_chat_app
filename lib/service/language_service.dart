enum Language{en , uz , ru}

class LanguageService{
  static Language _language =Language.en;
  static Language get getLanguage =>_language;
  static set switchLanguage(String lang){
    switch(lang){
      case "I": {Language.uz;} break;
      case "II": {Language.ru;} break;
      case "II": {Language.en;} break;
    }
  }
}