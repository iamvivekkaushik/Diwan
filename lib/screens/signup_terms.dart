import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/auth.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/helper/helper.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupTermsScreen extends StatefulWidget {
  final Map<String, String> data;

  SignupTermsScreen(this.data);

  @override
  _SignupTermsScreenState createState() => _SignupTermsScreenState();
}

class _SignupTermsScreenState extends State<SignupTermsScreen> {
  bool agreeToAll = true;
  bool agreeToTerms = true;
  bool agreeToCollection = true;
  bool agreeToAge = true;
  bool activityNotification = true;
  bool eventNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            Stack(
              children: <Widget>[
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.progressBarBg,
                ),
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.buttonBackground,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                AppLocalization.of(context).translate('terms_and_conditions'),
                style: boldTextHeading,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppLocalization.of(context).translate('terms_message'),
                style: subHeadingStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.termsBackground),
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width - 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () => _agreeToAll(),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          decoration: BoxDecoration(
                              color: AppColors.tickBackground,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Icon(
                              Icons.check,
                              size: 17,
                              color: agreeToAll ? Colors.black : AppColors.separator,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 4, 0, 0),
                        child: Text(
                          AppLocalization.of(context).translate('agree_to_all'),
                          style: termsHeadingStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _termView(
                term: AppLocalization.of(context)
                    .translate('agree_to_diwan_terms'),
                isSelected: agreeToTerms,
                isOptional: false,
                link: "",
                onTap: () {
                  setState(() {
                    agreeToTerms = !agreeToTerms;
                  });
                }),
            _termView(
                term: AppLocalization.of(context)
                    .translate('agree_to_collection'),
                isSelected: agreeToCollection,
                isOptional: false,
                link: "",
                onTap: () {
                  setState(() {
                    agreeToCollection = !agreeToCollection;
                  });
                }),
            _termView(
                term:
                    AppLocalization.of(context).translate('agree_to_age_limit'),
                isSelected: agreeToAge,
                isOptional: false,
                onTap: () {
                  setState(() {
                    agreeToAge = !agreeToAge;
                  });
                }),
            _termView(
                term: AppLocalization.of(context)
                    .translate('activity_notification_term'),
                desc: AppLocalization.of(context)
                    .translate('activity_notification_term_desc'),
                isSelected: activityNotification,
                isOptional: false,
                onTap: () {
                  setState(() {
                    activityNotification = !activityNotification;
                  });
                }),
            _termView(
                term: AppLocalization.of(context)
                    .translate('event_notification_term'),
                desc: AppLocalization.of(context)
                    .translate('event_notification_term_desc'),
                isSelected: eventNotification,
                isOptional: false,
                onTap: () {
                  setState(() {
                    eventNotification = !eventNotification;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RaisedButton(
                onPressed: () => _signUpAndNext(),
                color: AppColors.buttonBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(7),
                ),
                child: Text(
                  AppLocalization.of(context).translate('next'),
                  style: buttonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _termView(
      {String term,
      String desc,
      bool isSelected,
      bool isOptional,
      String link, GestureTapCallback onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: onTap,
                child: Container(
                  width: 30,
                  margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Center(
                      child: Icon(Icons.check,
                          size: 15,
                          color:
                              isSelected ? Colors.black : AppColors.separator)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: link != null
                    ? MediaQuery.of(context).size.width / 1.8
                    : MediaQuery.of(context).size.width / 3 * 2.2,
                child: Text(
                  term,
                  style: termsHeadingStyle,
                ),
              ),
              link != null
                  ? Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            AppLocalization.of(context).translate('see_more'),
                            style: termsSeeMoreStyle,
                          )))
                  : Container(),
            ],
          ),
          desc != null
              ? Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 10, 0),
                  width: MediaQuery.of(context).size.width / 3 * 2.2,
                  child: Text(
                    desc,
                    style: termsDescStyle,
                  ))
              : Container(),
        ],
      ),
    );
  }

  void _agreeToAll() {
    setState(() {
      agreeToAll = !agreeToAll;

      if(agreeToAll) {
        agreeToTerms = true;
        agreeToCollection = true;
        agreeToAge = true;
        activityNotification = true;
        eventNotification = true;
      } else {
        agreeToTerms = false;
        agreeToCollection = false;
        agreeToAge = false;
        activityNotification = false;
        eventNotification = false;
      }
    });
  }

  void _signUpAndNext() {
    if (!agreeToTerms || !agreeToCollection || !agreeToAge) {
      Fluttertoast.showToast(
        msg: "Agree to the terms to continue.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
      );
      return;
    }

    loadingDialog(context, "Signing In");

    AuthService.instance
        .signUp(
            name: widget.data['name'],
            email: widget.data['email'],
            password: widget.data['password'],
            country: widget.data['country'])
        .then((onValue) {
      // Account created move to verification screen

      Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/email_confirmation',
          arguments: {"email": widget.data['email'], "isSignUp": true});
    }).catchError((onError) {
      // Some Error Occurred while creating the account

      Fluttertoast.showToast(
        msg: "Some error occurred",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
      );
    });
  }
}
