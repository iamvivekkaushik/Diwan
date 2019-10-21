import 'package:diwan/screens/language_screen.dart';
import 'package:diwan/screens/splash_screen.dart';
import 'package:diwan/screens/welcome_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/SplashScreen':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/Welcome':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/LanguageSelection':
        return MaterialPageRoute(builder: (_) => LanguageScreen());
//      case '/Home':
//        return MaterialPageRoute(builder: (_) => Homepage(currentTab: args,));
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
