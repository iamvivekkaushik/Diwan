import 'package:diwan/config/config.dart';
import 'package:diwan/helper/pref.dart';
import 'package:diwan/route_generator.dart';
import 'package:diwan/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'helper/app_localization.dart';

void main() {
  SharedPref.instance.init().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(SharedPref.instance.getString("language_pref"));
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
        if (SharedPref.instance.containsKey("language_pref")) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode ==
                SharedPref.instance.getString("language_pref")) {
              return supportedLocale;
            }
          }
        }

        if (locale == null) return supportedLocales.first;

        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        // Current Device locale is not supported, fallback to english
        return supportedLocales.first;
      },
      home: SplashPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
