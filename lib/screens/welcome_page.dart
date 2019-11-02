import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/auth.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                    Navigator.of(context).pushNamed('/languageSelection');
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
                  onPressed: () {
                    // ToDo: Implement Twitter login
                    Navigator.of(context).pushNamed('/signup/password');
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Image.asset("images/google.png"),
                  onPressed: () {
                    authService.googleSignIn().then((firebaseUser) {
                      Navigator.of(context).pushNamed('/signup/password');
                    }).catchError((onError) {
                      _showSnackbar("Sign In Failed. Try Again.", context);
                    });
                  },
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
                      // ToDo: Forgot password screen
                      authService.signOut();
//                    Navigator.of(context).pushNamed("/groupDetail");
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

  void _showSnackbar(message, context) {
    final snackBar = SnackBar(
      content: Text('Warning: $message'),
      duration: Duration(seconds: 30),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
