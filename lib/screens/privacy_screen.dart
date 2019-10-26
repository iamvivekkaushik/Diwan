import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
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
          Container(
            width: MediaQuery.of(context).size.width,
            child: Divider(
              color: AppColors.separator,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: _createRowWithIcon(
                title: AppLocalization.of(context).translate('privacy_policy'),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColors.separator,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: _createRowWithIcon(
                title: AppLocalization.of(context).translate('terms_of_use'),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColors.separator,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: _createRowWithIcon(
                title:
                    AppLocalization.of(context).translate('terms_of_operation'),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColors.separator,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: _createRowWithIcon(
                title: AppLocalization.of(context)
                    .translate('terms_of_use_for_paid'),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColors.separator,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: _createRowWithIcon(
                title: AppLocalization.of(context)
                    .translate('open_source_license'),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColors.separator,
            ),
          )
        ],
      ),
    );
  }

  Widget _createRowWithIcon({String title, String path}) {
    double width = MediaQuery.of(context).size.width - 80;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: width,
          child: Text(
            title,
            style: settingNameStyle,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'images/icon_forward.png',
              width: 10,
              height: 15,
            ),
          ),
        )
      ],
    );
  }
}
