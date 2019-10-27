import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class ServiceAnnouncementScreen extends StatefulWidget {
  @override
  _ServiceAnnouncementScreenState createState() =>
      _ServiceAnnouncementScreenState();
}

class _ServiceAnnouncementScreenState extends State<ServiceAnnouncementScreen> {
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
                      AppLocalization.of(context)
                          .translate('service_announcements'),
                      style: announcementAppBarStyle,
                    ),
                  ),
                ),
                Container(
                  width: 42,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Some Random Text",
                          style: announcementTextStyle,
                        ),

                        Text(
                          "2020.09.17",
                          style: commentDateStyle,
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: AppColors.separator,
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
