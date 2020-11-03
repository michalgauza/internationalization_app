import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  static const String languageCodeKey = "language_code";
  static const String defaultLanguageCode = "en";
  Locale _appLocale = Locale(defaultLanguageCode);

  Locale get appLocale => _appLocale;

  Future<void> fetchLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(languageCodeKey) == null) {
      _appLocale = Locale(defaultLanguageCode);
      return Null;
    }
    _appLocale = Locale(prefs.getString(languageCodeKey));
    return Null;
  }

  Future<void> changeLanguage(Locale type) async {
    if (_appLocale == type) {
      return;
    }
    switch (type.languageCode) {
      case "en":
        _appLocale = Locale("en");
        await _saveLanguage("en");
        break;
      case "pl":
        _appLocale = Locale("pl");
        await _saveLanguage("pl");
        break;
      case "de":
        _appLocale = Locale("de");
        await _saveLanguage("de");
        break;
      case "fr":
        _appLocale = Locale("fr");
        await _saveLanguage("fr");
        break;
    }
    notifyListeners();
  }

  Future<void> _saveLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageCodeKey, languageCode);
  }
}
