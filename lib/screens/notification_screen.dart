import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              AppLocalization.of(context).translate('notifications'),
              style: boldTextHeading,
            ),
          ),

          SizedBox(
            height: 30,
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            color: AppColors.notificationBannerBg,
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 3 * 2,
                      child: Text(
                        "Get our exclusive discount code",
                        style: notificationBannerHeadingStyle,
                      ),
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width / 3 * 2,
                      child: Text(
                        "Available until 12 AM on Oct. 30 (GMT)",
                        style: notificationBannerSubHeadingStyle,
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                      ),
                      width: 40,
                      height: 40,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
