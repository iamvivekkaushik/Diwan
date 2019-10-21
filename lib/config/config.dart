import 'package:flutter/material.dart';

class AppLanguage {
  static const Iterable<Locale> supportedLocale = [
    const Locale('en'), // English
    const Locale('ar'), // Arabic
    const Locale('ko') // Korean
  ];

  static const List<String> supportedLanguages = [
    "English",
    "اللغه العربيه",
    "한글"
  ];
}
