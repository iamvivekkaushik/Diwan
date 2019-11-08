import 'package:diwan/screens/account_screen.dart';
import 'package:diwan/screens/announcement_screen.dart';
import 'package:diwan/screens/connect_account_screen.dart';
import 'package:diwan/screens/country_selection_screen.dart';
import 'package:diwan/screens/create_diwan_screen.dart';
import 'package:diwan/screens/create_user_screen.dart';
import 'package:diwan/screens/customer_care_screen.dart';
import 'package:diwan/screens/diwan_screen.dart';
import 'package:diwan/screens/email_verification_screen.dart';
import 'package:diwan/screens/group_detail_screen.dart';
import 'package:diwan/screens/homepage.dart';
import 'package:diwan/screens/language_screen.dart';
import 'package:diwan/screens/login_password_screen.dart';
import 'package:diwan/screens/post_comment.dart';
import 'package:diwan/screens/post_translation.dart';
import 'package:diwan/screens/privacy_screen.dart';
import 'package:diwan/screens/setting_screen.dart';
import 'package:diwan/screens/signup_create_password.dart';
import 'package:diwan/screens/login_email_screen.dart';
import 'package:diwan/screens/signup_name_screen.dart';
import 'package:diwan/screens/signup_terms.dart';
import 'package:diwan/screens/splash_screen.dart';
import 'package:diwan/screens/support_screen.dart';
import 'package:diwan/screens/welcome_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final dynamic args = settings.arguments;
    switch (settings.name) {
      case '/splashScreen':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/login/email':
        return MaterialPageRoute(builder: (_) => EmailLoginScreen());
      case '/login/password':
        return MaterialPageRoute(
            builder: (_) => LoginPasswordScreen(
                  email: args,
                ));
      case '/signup/password':
        return MaterialPageRoute(builder: (_) => PasswordSignupScreen());
      case '/signup/name':
        return MaterialPageRoute(builder: (_) => SignupNameScreen(
          args
        ));
      case '/signup/country':
        return MaterialPageRoute(builder: (_) => CountrySelectionScreen(
          args['password'], args['name']
        ));
      case '/signup/terms':
        return MaterialPageRoute(builder: (_) => SignupTermsScreen());
      case '/signup/verification':
        return MaterialPageRoute(builder: (_) => EmailVerificationScreen());
      case '/languageSelection':
        return MaterialPageRoute(builder: (_) => LanguageScreen());
      case '/homepage':
        return MaterialPageRoute(
            builder: (_) => HomepageScreen(
              args,
            ));
      case '/diwan':
        return MaterialPageRoute(builder: (_) => DiwanScreen());
      case '/post/comment':
        return MaterialPageRoute(
            builder: (_) => PostCommentScreen(
                  args,
                ));
      case '/privacy':
        return MaterialPageRoute(builder: (_) => PrivacyScreen());
      case '/account':
        return MaterialPageRoute(builder: (_) => AccountScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case '/connectAccount':
        return MaterialPageRoute(builder: (_) => ConnectAccountScreen());
      case '/postTranslation':
        return MaterialPageRoute(builder: (_) => PostTranslationScreen());
      case '/customerCare':
        return MaterialPageRoute(builder: (_) => CustomerCareScreen());
      case '/serviceAnnouncement':
        return MaterialPageRoute(builder: (_) => ServiceAnnouncementScreen());
      case '/supportScreen':
        return MaterialPageRoute(builder: (_) => SupportScreen());
      case '/groupDetail':
        return MaterialPageRoute(builder: (_) => GroupDetailScreen());
      case '/admin/create_user':
        return MaterialPageRoute(builder: (_) => CreateUserScreen());
      case '/admin/create_diwan':
        return MaterialPageRoute(builder: (_) => CreateDiwanScreen(args,));
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
