import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class LoginPasswordScreen extends StatefulWidget {
  final String email;

  LoginPasswordScreen({this.email = ""});

  @override
  _LoginPasswordScreenState createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
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
                //ToDo: Change with user provided email
                "user@email.com",
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        AppLocalization.of(context).translate('enter_password'),
                    hintStyle: textFieldHintStyle,
                  ),
                  style: textFieldStyle,
                ),
              ),
            ),
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
                    Text(
                      AppLocalization.of(context).translate('forgot_password'),
                      style: subHeadingStyle,
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
                onPressed: () {
                  // ToDo: Check for login and go to home screen
                  Navigator.of(context).pushNamed('/homepage');
                },
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
}
