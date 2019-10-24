import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static final LocalizationsDelegate<AppLocalization> delegate =
      new _AppLocalizationDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the json file from the lang folder
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    // Convert json map to <String, String>
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'ko'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = new AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
