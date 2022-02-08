import 'package:bazar_updated/viewmodel/localization/language/language_en.dart';
import 'package:bazar_updated/viewmodel/localization/language/language_es.dart';
import 'package:bazar_updated/viewmodel/localization/language/languages.dart';
import 'package:flutter/material.dart';



class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return  LanguageEn();
      case 'es':
        return LanguageEs();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
