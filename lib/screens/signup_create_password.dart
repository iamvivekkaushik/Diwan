import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class PasswordSignupScreen extends StatefulWidget {
  @override
  _PasswordSignupScreenState createState() => _PasswordSignupScreenState();
}

class _PasswordSignupScreenState extends State<PasswordSignupScreen> {
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
                icon: Icon(DiwanIcons.back, size: 18,),
                color: AppColors.blackIcon,
                onPressed: () {
                  // Go Back To previous Screen
                  Navigator.of(context).pop();
                },
              ),
            ),

            Stack(
              children: <Widget>[
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.progressBarBg,
                ),

                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width / 3,
                  color: AppColors.buttonBackground,
                ),
              ],
            ),

            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                AppLocalization.of(context).translate('create_password'),
                style: boldTextHeading,
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppLocalization.of(context).translate('password_signup_desc'),
                style: subHeadingStyle,
              ),
            ),

            SizedBox(
              height: 20,
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
                  border: new Border.all(color: AppColors.textFieldBorder)
              ),

              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppLocalization.of(context).translate('enter_password'),
                    hintStyle: textFieldHintStyle,
                  ),
                  style: textFieldStyle,
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Text(
                AppLocalization.of(context).translate('password_requirement_one'),
                style: subHeadingStyle,
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                AppLocalization.of(context).translate('password_requirement_two'),
                style: subHeadingStyle,
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                AppLocalization.of(context).translate('password_requirement_three'),
                style: subHeadingStyle,
              ),
            ),

            SizedBox(
              height: 40,
            ),


            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                  child: Text(
                    AppLocalization.of(context).translate('confirm_password'),
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
                  border: new Border.all(color: AppColors.textFieldBorder)
              ),

              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppLocalization.of(context).translate('enter_password'),
                    hintStyle: textFieldHintStyle,
                  ),
                  style: textFieldStyle,
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppLocalization.of(context).translate('password_not_match'),
                style: subHeadingStyle,
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Container(
              height: 45,
              width: MediaQuery.of(context).size.width-40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup/name');
                },
                color: AppColors.buttonBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(7),
                ),
                child: Text(AppLocalization.of(context).translate('next'),
                  style: buttonTextStyle,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
