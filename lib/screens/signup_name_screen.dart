import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class SignupNameScreen extends StatefulWidget {
  @override
  _SignupNameScreenState createState() => _SignupNameScreenState();
}

class _SignupNameScreenState extends State<SignupNameScreen> {
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
            Stack(
              children: <Widget>[
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.progressBarBg,
                ),
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width / 2,
                  color: AppColors.buttonBackground,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                AppLocalization.of(context).translate('enter_name'),
                style: boldTextHeading,
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
                    AppLocalization.of(context).translate('first_name'),
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
                    hintText: AppLocalization.of(context)
                        .translate('enter_first_name'),
                    hintStyle: textFieldHintStyle,
                  ),
                  style: textFieldStyle,
                ),
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
                    AppLocalization.of(context).translate('last_name'),
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
                    hintText: AppLocalization.of(context)
                        .translate('enter_last_name'),
                    hintStyle: textFieldHintStyle,
                  ),
                  style: textFieldStyle,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup/country');
                },
                color: AppColors.buttonBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(7),
                ),
                child: Text(
                  AppLocalization.of(context).translate('next'),
                  style: buttonTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
