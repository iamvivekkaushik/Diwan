import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
//            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                      AppLocalization.of(context).translate('settings'),
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

          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),

                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    AppLocalization.of(context).translate('account'),
                    style: settingCategoryTitleStyle,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                     child: _createRow(title: AppLocalization.of(context).translate('email'),
                     subText: "email@example.com")),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: _createRow(title: AppLocalization.of(context).translate('name'),
                        subText: "John Doe",
                    path: "")),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: _createRow(title: AppLocalization.of(context).translate('password'),
                        subText: AppLocalization.of(context).translate('change'),
                    path: "")),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: _createRow(title: AppLocalization.of(context).translate('connect_accounts'),
                        subText: AppLocalization.of(context).translate('change'),
                        path: "/connectAccount")),


                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Divider(
                    color: AppColors.separator,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    AppLocalization.of(context).translate('general'),
                    style: settingCategoryTitleStyle,
                  ),
                ),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: _createRow(title: AppLocalization.of(context).translate('app_language'),
                        subText: "English", path: "/languageSelection")),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: _createRow(title: AppLocalization.of(context).translate('post_translation'),
                        subText: AppLocalization.of(context).translate('change'),
                        path: "/postTranslation")),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: _createRow(title: AppLocalization.of(context).translate('notifications'),
                        subText: AppLocalization.of(context).translate('change'),
                        path: "")),

                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Divider(
                    color: AppColors.separator,
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    AppLocalization.of(context).translate('support'),
                    style: settingCategoryTitleStyle,
                  ),
                ),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: _createRowWithIcon(title: AppLocalization.of(context).translate('customer_care'),
                        path: "/customerCare")),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: _createRowWithIcon(title: AppLocalization.of(context).translate('service_announcements'),
                        path: "/serviceAnnouncement")),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _createRow({String title, String subText, String path}) {
    double width = (MediaQuery.of(context).size.width - 24) / 2;
    return InkWell(
      onTap: () {
        if(path == null || path.isEmpty) return;
        Navigator.of(context).pushNamed(path);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width - 30,
            child: Text(
              title,
              style: settingNameStyle,
            ),
          ),
          Container(
            width: width,
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  subText,
                  style: path != null ? settingSubTextActiveStyle : settingSubTextInactiveStyle,
                )),
          )
        ],
      ),
    );
  }

  Widget _createRowWithIcon({String title, String path}) {
    double width = MediaQuery.of(context).size.width - 80;
    return InkWell(
      onTap: () {
        if(path == null || path.isEmpty) return;

        Navigator.of(context).pushNamed(path);
      },
      child: Row(
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
          Image.asset('images/icon_forward.png', width: 10,
              height: 15,)
        ],
      ),
    );
  }
}
