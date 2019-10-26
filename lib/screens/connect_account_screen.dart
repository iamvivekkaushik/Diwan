import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class ConnectAccountScreen extends StatefulWidget {
  @override
  _ConnectAccountScreenState createState() => _ConnectAccountScreenState();
}

class _ConnectAccountScreenState extends State<ConnectAccountScreen> {
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
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                      // Go Back
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      AppLocalization.of(context).translate('connect_accounts'),
                      style: appBarTextStyle,
                    ),
                  ),
                ),
                Container(
                  width: 42,
                )
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            child: Divider(
              color: AppColors.separator,
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              AppLocalization.of(context).translate('connect_social_message'),
              style: commentUsernameStyle,
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
              child: _createRowWithIcon(title: "Twitter", image: "images/twitter.png", path: "")),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Divider(
              color: AppColors.separator,
            ),
          ),

          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: _createRowWithIcon(title: "Google", image: "images/google.png", path: "")),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Divider(
              color: AppColors.separator,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createRowWithIcon({String title, String image, String path}) {
    double width = (MediaQuery.of(context).size.width / 4) * 2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Image.asset(image, width: 25,),
        ),

        SizedBox(
          width: 20,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: width,
          child: Text(
            title,
            style: settingNameStyle,
          ),
        ),

        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset('images/add_icon.png', width: 20,
                height: 20,),
            ),
          ),
        )
      ],
    );
  }
}
