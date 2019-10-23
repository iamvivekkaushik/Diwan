import 'package:diwan/config/config.dart';
import 'package:diwan/route_generator.dart';
import 'package:diwan/screens/language_screen.dart';
import 'package:diwan/screens/signup_create_password.dart';
import 'package:diwan/screens/signup_name_screen.dart';
import 'package:diwan/screens/welcome_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'helper/app_localization.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diwan',
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: AppLanguage.supportedLocale,
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        // In iOS this method is called twice. On first call locale is null.
        if(locale == null) return supportedLocales.first;

        for(var supportedLocale in supportedLocales) {
          if(supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        // Current Device locale is not supported, fallback to english
        return supportedLocales.first;
      },
      home: SignupNameScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}