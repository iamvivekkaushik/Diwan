import 'package:diwan/screens/country_selection_screen.dart';
import 'package:diwan/screens/email_verification_screen.dart';
import 'package:diwan/screens/language_screen.dart';
import 'package:diwan/screens/login_password_screen.dart';
import 'package:diwan/screens/signup_create_password.dart';
import 'package:diwan/screens/signup_email_screen.dart';
import 'package:diwan/screens/signup_name_screen.dart';
import 'package:diwan/screens/signup_terms.dart';
import 'package:diwan/screens/splash_screen.dart';
import 'package:diwan/screens/welcome_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/splashScreen':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/signup/email':
        return MaterialPageRoute(builder: (_) => EmailSignupScreen());
      case '/signup/password':
        return MaterialPageRoute(builder: (_) => PasswordSignupScreen());
      case '/signup/name':
        return MaterialPageRoute(builder: (_) => SignupNameScreen());
      case '/signup/country':
        return MaterialPageRoute(builder: (_) => CountrySelectionScreen());
      case '/signup/terms':
        return MaterialPageRoute(builder: (_) => SignupTermsScreen());
      case '/signup/verification':
        return MaterialPageRoute(builder: (_) => EmailVerificationScreen());
      case '/languageSelection':
        return MaterialPageRoute(builder: (_) => LanguageScreen());
      case '/login/password':
        return MaterialPageRoute(builder: (_) => LoginPasswordScreen(email: args,));
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
