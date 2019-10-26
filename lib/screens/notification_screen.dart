import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class NotificationStatusScreen extends StatefulWidget {
  @override
  _NotificationStatusScreenState createState() =>
      _NotificationStatusScreenState();
}

class _NotificationStatusScreenState extends State<NotificationStatusScreen> {
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
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                Expanded(
                  child: Center(
                    child: Text(
                      AppLocalization.of(context).translate('notifications'),
                      style: appBarRegTextStyle,
                    ),
                  ),
                ),
                Container(
                  width: 50,
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
            width: MediaQuery.of(context).size.width,
            child: Text(
              AppLocalization.of(context).translate('notification_turned_off'),
              style: boldTextHeading,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
              AppLocalization.of(context).translate('notification_message'),
              style: subHeadingStyle,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          _createRow(
              "1",
              AppLocalization.of(context).translate('tap_notification'),
              'images/notification_off.png'),
          _createRow(
              "2",
              AppLocalization.of(context).translate('allow_notification_msg'),
              'images/ios_button.png'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              onPressed: () {
                // Go to Notification Settings
              },
              color: AppColors.buttonBackground,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15),
              ),
              child: Container(
                height: 30,
                width: 120,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalization.of(context).translate('open_setting'),
                    style: buttonTextStyle2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createRow(String index, String text, String image) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            index + ".",
            style: announcementTextStyle,
          ),
          SizedBox(
            width: 10,
          ),
          Center(
              child: Image.asset(
            image,
            width: 20,
          )),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: announcementTextStyle,
          )
        ],
      ),
    );
  }
}
