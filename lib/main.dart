import 'package:diwan/config/config.dart';
import 'package:diwan/route_generator.dart';
import 'package:diwan/screens/admin/admin_account_screen.dart';
import 'package:diwan/screens/admin/trends_screen.dart';
import 'package:diwan/screens/create_diwan_screen.dart';
import 'package:diwan/screens/create_user_screen.dart';
import 'package:diwan/screens/discover_screen.dart';
import 'package:diwan/screens/group_detail_screen.dart';
import 'package:diwan/screens/homepage.dart';
import 'package:diwan/screens/support_screen.dart';
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
        if (locale == null) return supportedLocales.first;

        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        // Current Device locale is not supported, fallback to english
        return supportedLocales.first;
      },
      home: AdminAccountScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
