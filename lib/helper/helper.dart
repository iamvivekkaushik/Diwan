import 'package:diwan/res/colors.dart';
import 'package:flutter/material.dart';

void createSnackbar(BuildContext context, {String message, String buttonLabel = "OK", VoidCallback onPressed}) {
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