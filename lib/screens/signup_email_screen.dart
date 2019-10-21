import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class EmailSignupScreen extends StatefulWidget {
  @override
  _EmailSignupScreenState createState() => _EmailSignupScreenState();
}

class _EmailSignupScreenState extends State<EmailSignupScreen> {
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
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
              icon: Icon(DiwanIcons.back, size: 18,),
              color: AppColors.blackIcon,
              onPressed: () {},
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
              )


            ],
          )
        ],
      ),
    );
  }
}
