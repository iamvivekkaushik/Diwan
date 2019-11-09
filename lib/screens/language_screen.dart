import 'package:diwan/config/config.dart';
import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/pref.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  final bool isLogin;

  LanguageScreen(this.isLogin);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = AppLanguage.supportedLanguages.first;

  @override
  void initState() {
    if (SharedPref.instance.containsKey("language_pref")) {
      _selectedLanguage = SharedPref.instance.getString("language_pref");
    }
    super.initState();
  }

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
                    AppLocalization.of(context).translate('choose_language'),
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
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          width: MediaQuery.of(context).size.width - 20,
          child: Text(
            AppLocalization.of(context).translate('language_message'),
            style: subHeadingStyle,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.6,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: AppLanguage.supportedLanguages.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  groupValue: _selectedLanguage,
                  title: Text("${AppLanguage.languageList[index]['language']}"),
                  value: AppLanguage.languageList[index]['code'],
                  onChanged: (val) {
                    setState(() {
                      _selectedLanguage = val;
                    });
                  },
                  activeColor: AppColors.buttonBackground,
                );
              }),
        ),
        Expanded(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: RaisedButton(
                onPressed: _saveAndExit,
                color: AppColors.buttonBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(7),
                ),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalization.of(context).translate('done'),
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  void _saveAndExit() {
    // Save and go to next page reload app language
    SharedPref.instance.setString("language_pref", _selectedLanguage);
    if(widget.isLogin) {
      Navigator.of(context).pushNamed('/login/email');
    } else {
      Navigator.of(context).pop();
    }
  }
}
