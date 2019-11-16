import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/helper/helper.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmailLoginScreen extends StatefulWidget {
  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  String email;
  String validationMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: Dimen.topMargin,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                icon: Icon(
                  DiwanIcons.back,
                  size: 18,
                ),
                color: AppColors.blackIcon,
                onPressed: () {
                  // Go Back To previous Screen
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                AppLocalization.of(context).translate('what_your_email'),
                style: boldTextHeading,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                  child: Text(
                    AppLocalization.of(context).translate('email'),
                    style: inputLabelStyle,
                  ),
                ),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.buttonBackground,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 45,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: new Border.all(color: AppColors.textFieldBorder)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        AppLocalization.of(context).translate('enter_email'),
                    hintStyle: textFieldHintStyle,
                  ),
                  onChanged: (value) {
                    validationMessage = "";
                    setState(() {
                      email = value;
                    });
                  },
                  style: textFieldStyle,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                validationMessage,
                style: errorMessageTextStyle,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppLocalization.of(context).translate('continue_with_social') +
                    '?',
                style: TextStyle(
                  color: AppColors.buttonBackground,
                  fontFamily: 'Segoe',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: RaisedButton(
                onPressed: () => validateAndNext(),
                color: AppColors.buttonBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(7),
                ),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width - 70,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalization.of(context).translate('next'),
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateAndNext() {
    if (email == null || email.isEmpty) {
      setState(() {
        validationMessage = "Email can\'t be empty";
      });
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      setState(() {
        validationMessage = "Email is invalid";
      });
    } else {
      // Email validation complete do some stuff

      loadingDialog(context, "Checking for email");

      // Check if user with this email exist
      FirebaseAuth.instance
          .fetchSignInMethodsForEmail(email: email)
          .then((onValue) {
        if (onValue.length > 0) {
          // User with this email exist
          Navigator.of(context)
            ..pop()
            ..pushNamed('/login/password', arguments: email);
        } else {
          // User does not exist
          Navigator.of(context)
            ..pop()
            ..pushNamed('/signup/password', arguments: {"email": email});
        }
      }).catchError((onError) {
        // Some error occurred while checking for user

        Navigator.of(context).pop();
        Fluttertoast.showToast(
          msg: onError,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
        );
      });
    }
  }
}
