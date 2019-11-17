import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/auth.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/helper/helper.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: Dimen.topMargin,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppLocalization.of(context).translate('login_or_signup'),
                style: appBarTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Text(
                AppLocalization.of(context).translate('welcome_to_diwan'),
                style: boldTextHeading,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Text(
                AppLocalization.of(context).translate('welcome_message'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: RaisedButton(
                  onPressed: () {
                    // Go to Email SignUp Page
                    Navigator.of(context)
                        .pushNamed('/languageSelection', arguments: true);
                  },
                  color: AppColors.buttonBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(7),
                  ),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 80,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalization.of(context)
                            .translate('continue_with_email'),
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Stack(alignment: AlignmentDirectional.center, children: <Widget>[
              SizedBox(
                  height: 60.0,
                  width: 400.0,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width - 40,
                          child: Divider(color: AppColors.separator)),
                      Container(
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 3, 8, 0),
                            child: Text(
                                AppLocalization.of(context)
                                    .translate('continue_with_social'),
                                style: textSeparatorStyle),
                          ),
                          color: Colors.white)
                    ],
                  )),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Image.asset("images/twitter.png"),
                  onPressed: () => _handleTwitterLogin(),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Image.asset("images/google.png"),
                  onPressed: () => _handleGoogleLogin(),
                ),
              ],
            ),
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "images/question_mark.png",
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/forgotPassword");
                    },
                    child: Text(
                      AppLocalization.of(context).translate('forgot_password'),
                      style: textSeparatorStyle,
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  void _handleTwitterLogin() {
    loadingDialog(context, "Signing In");

    AuthService authService = AuthService.instance;
    authService.twitterSignIn().then((firebaseUser) {
      Navigator.of(context).pop();

      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((Object onError) {
      Navigator.of(context).pop();

      print(onError.toString());
      Fluttertoast.showToast(
        msg: onError.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
      );
    });
  }

  void _handleGoogleLogin() {
    loadingDialog(context, "Signing In");

    AuthService authService = AuthService.instance;
    authService.googleSignIn().then((firebaseUser) {
      Navigator.of(context).pop();

      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((onError) {
      Navigator.of(context).pop();

      Fluttertoast.showToast(
        msg: "Failed to sign in with Google",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 2,
      );
    });
  }
}
