import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
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
      backgroundColor: Colors.white,
      body: Column(
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
                  Navigator.of(context).pushNamed('/signup/email');
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
                    child: Text(AppLocalization.of(context).translate('continue_with_email'),
                    style: buttonTextStyle,),
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
                          child: Divider(color: AppColors.separator)),

                      Container(height: 30,
                          child: Text(AppLocalization.of(context).translate('continue_with_social'),
                              style: textSeparatorStyle),
                          color: Colors.white)
                    ],)),
          ]),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Image.asset("images/twitter.png"),
                onPressed: () {},
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Image.asset("images/google.png"),
                onPressed: () {},
              ),
            ],
          ),

          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("images/question_mark.png", width: 20, height: 20,),
                    SizedBox(width: 5,),
                    Text(AppLocalization.of(context).translate('forgot_password'),
                    style: textSeparatorStyle,)
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
