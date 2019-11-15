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

class EmailVerificationScreen extends StatefulWidget {
  final String email;
  final bool isSignUp;

  EmailVerificationScreen(this.email, this.isSignUp);

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: Dimen.topMargin,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: IconButton(
            icon: Image.asset(
              'images/close.png',
              width: 12,
              height: 12,
            ),
            color: AppColors.blackIcon,
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/welcome', (Route<dynamic> route) => false);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: Text(
            AppLocalization.of(context).translate('verify_email'),
            style: boldTextHeading,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            AppLocalization.of(context).translate('complete_signup_msg'),
            style: subHeadingStyle,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            widget.email.toLowerCase().toString(),
            style: textHeadingStyle,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset('images/verification_image.png'),
        ),
        Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  color: AppColors.termsBackground,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalization.of(context)
                            .translate('email_not_received'),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Segoe',
                            color: AppColors.textFieldHint),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => _resendEmail(),
                        child: Text(
                          AppLocalization.of(context).translate('resend_email'),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Segoe',
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                )))
      ],
    ));
  }

  void _resendEmail() {
    loadingDialog(context, "Sending Link");

    if (widget.isSignUp) {
      // send the email verification email

      AuthService.instance.firebaseUser.sendEmailVerification().then((onValue) {
        Navigator.of(context).pop();
        Fluttertoast.showToast(
          msg: "Email Sent",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
        );
      }).catchError((onError) {
        Navigator.of(context).pop();
        Fluttertoast.showToast(
          msg: "An error occurred",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
        );
      });
    } else {
      // send the password reset email

      FirebaseAuth.instance
          .sendPasswordResetEmail(email: widget.email)
          .then((onValue) {
        Navigator.of(context).pop();
        Fluttertoast.showToast(
          msg: "Email Sent",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
        );
      }).catchError((onError) {
        Navigator.of(context).pop();
        Fluttertoast.showToast(
          msg: "An error occurred",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
        );
      });
    }
  }
}
