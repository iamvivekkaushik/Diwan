import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: IconButton(
            icon: Image.asset(
              'images/close.png',
              width: 12,
              height: 12,
            ),
            color: AppColors.blackIcon,
            onPressed: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: Text(
            AppLocalization.of(context).translate('verify_email'),
            style: boldTextHeading,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            AppLocalization.of(context).translate('complete_signup_msg'),
            style: subHeadingStyle,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            "example@email.com",
            style: textHeadingStyle,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset('images/verification_image.png'),
        ),
        Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  color: AppColors.termsBackground,
                  child: InkWell(
                    onTap: () {
                      // ToDo: Go to forgot screen
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalization.of(context)
                              .translate('email_not_received'),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Segoe',
                              color: AppColors.textFieldHint),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppLocalization.of(context).translate('resend_email'),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Segoe',
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                )))
      ],
    ));
  }
}
