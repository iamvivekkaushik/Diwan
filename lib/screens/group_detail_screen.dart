import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:diwan/screens/group_details/feed.dart';
import 'package:diwan/ui/app_pager.dart';
import 'package:flutter/material.dart';

class GroupDetailScreen extends StatefulWidget {
  @override
  _GroupDetailScreenState createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
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
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
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
                  child: Align(
                    alignment: Alignment.topRight,
                  ),
                )
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        // ToDo: Group name
                        "Entertainment",
                        style: boldTextHeading,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      child: Text(
                        "20,000,000" + " " + AppLocalization.of(context).translate('followers').toLowerCase(),
                        style: subHeadingStyle,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            height: 40,
            child: AppPager(
              pagerList: ['Feed', 'Official', 'Media'],
              fitWidth: true,
              pageChanged: (index) {
                // Page Changed
              },
            ),
          ),

          Expanded(
            child: GroupFeedScreen()
          )
        ],
      ),
    );
  }
}
