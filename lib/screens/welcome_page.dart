import 'package:diwan/localization/app_localization.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
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
          )
        ],
      ),
    );
  }
}
