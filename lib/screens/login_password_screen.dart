import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/auth.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/helper/helper.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPasswordScreen extends StatefulWidget {
  final String email;

  LoginPasswordScreen({this.email = ""});

  @override
  _LoginPasswordScreenState createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
  String password = "";
  String _errorMessage = "";
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
  }

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
                widget.email,
                style: boldTextHeading,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                AppLocalization.of(context)
                    .translate('password_requirement_desc'),
                style: subHeadingStyle,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                  child: Text(
                    AppLocalization.of(context).translate('password'),
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
                child: TextField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        AppLocalization.of(context).translate('enter_password'),
                    hintStyle: textFieldHintStyle,
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.textFieldHint,
                      ),
                      onPressed: () {
                        setState(() {
                          setState(() {
                            _errorMessage = "";
                            hidePassword = !hidePassword;
                          });
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                  style: textFieldStyle,
                ),
              ),
            ),
            _errorMessage.isNotEmpty
                ? Container(
                    width: MediaQuery.of(context).size.width - 40,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      _errorMessage,
                      style: errorMessageTextStyle,
                    ),
                  )
                : Container(),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                AppLocalization.of(context)
                    .translate('password_requirement_one'),
                style: subHeadingStyle,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                AppLocalization.of(context)
                    .translate('password_requirement_two'),
                style: subHeadingStyle,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                AppLocalization.of(context)
                    .translate('password_requirement_three'),
                style: subHeadingStyle,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 1.5,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 140,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "images/question_mark.png",
                      width: 14,
                      color: AppColors.blackIcon,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseAuth.instance.sendPasswordResetEmail(email: widget.email);
                        Navigator.of(context).pushNamed("/email_confirmation",
                            arguments: {
                              "email": widget.email,
                              "isSignUp": false
                            });
                      },
                      child: Text(
                        AppLocalization.of(context)
                            .translate('forgot_password'),
                        style: subHeadingStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: RaisedButton(
                onPressed: () => _validateAndLogin(),
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
                      AppLocalization.of(context).translate('login'),
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

  void _validateAndLogin() {
    if (password.isEmpty) {
      setState(() {
        _errorMessage = "Password can\'t be empty";
      });
    } else if (password.length < 8) {
      setState(() {
        _errorMessage = "Password must be 8 characters long";
      });
    } else {
      loadingDialog(context, "Signing In");
      AuthService.instance
          .loginWithEmailAndPassword(widget.email, password)
          .then((onValue) {
        // Login success Go to homepage
        Navigator.of(context).pop(); // Remove loading Dialog
        AuthService.instance.fetchUserData();
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/homepage', (Route<dynamic> route) => false);
      }).catchError((onError) {
        Navigator.of(context).pop(); // Remove loading Dialog
        setState(() {
          _errorMessage = "Either user does not exist or wrong password";
        });
      });
    }
  }
}
