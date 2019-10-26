import 'package:diwan/config/config.dart';
import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class PostTranslationScreen extends StatefulWidget {
  @override
  _PostTranslationScreenState createState() => _PostTranslationScreenState();
}

class _PostTranslationScreenState extends State<PostTranslationScreen> {
  String _selectedLanguage = AppLanguage.supportedLanguages.first;

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
                        AppLocalization.of(context).translate('post_translation'),
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
                AppLocalization.of(context).translate('post_translation_msg'),
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
                      title: Text("${AppLanguage.supportedLanguages[index]}"),
                      value: AppLanguage.supportedLanguages[index],
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
                    onPressed: () {
                      // ToDo: Set the post language to selected language

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
}
