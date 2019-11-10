import 'package:diwan/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:diwan/config/config.dart';

void createSnackbar(BuildContext context,
    {String message, String buttonLabel = "OK", VoidCallback onPressed}) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 30),
    action: SnackBarAction(
      label: buttonLabel,
      textColor: AppColors.buttonBackground,
      onPressed: onPressed,
    ),
  );

  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void loadingDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(8),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.buttonBackground),
                ),
                SizedBox(
                  height: 20,
                ),
                new Text(
                  message,
                ),
              ],
            ),
          ),
        );
      });
}

String getLanguageName(String languageCode) {
  String lang = "";
  AppLanguage.languageList.forEach((item) {
    if (item['code'] == languageCode) {
      lang = item['language'];
    }
  });

  return lang;
}
