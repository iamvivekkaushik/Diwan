import 'package:diwan/config/config.dart';
import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/auth.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/helper/helper.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatefulWidget {
  final String password, name;


  CountrySelectionScreen(this.password, this.name);

  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String dropdownValue = "India";

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
          Stack(
            children: <Widget>[
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width,
                color: AppColors.progressBarBg,
              ),
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width / 3 * 2,
                color: AppColors.buttonBackground,
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              AppLocalization.of(context).translate('where_you_from'),
              style: boldTextHeading,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                child: Text(
                  AppLocalization.of(context).translate('nationality'),
                  style: inputLabelStyle,
                ),
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.buttonBackground,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: new Border.all(color: AppColors.textFieldBorder)),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: DropdownButton<String>(
                value: dropdownValue,
                isExpanded: true,
                icon: Image.asset(
                  "images/dropdown_icon.png",
                  width: 11,
                  height: 6,
                ),
                style: TextStyle(fontFamily: 'Segoe', color: Colors.black),
                underline: Container(),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items:
                    countryList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  onPressed: () => _moveToNext(),
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
            ),
          )
        ],
      ),
    );
  }

  void _moveToNext() async {
    loadingDialog(context, "Signing In");

    AuthService authService = AuthService.instance;
    authService.updateUserData(name: widget.name, country: dropdownValue);
    await authService.updatePassword(widget.password);
    authService.updateProfile(name: widget.name).then((onValue) {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/signup/terms');
    }).catchError((onError) {
      Navigator.of(context).pop();
      createSnackbar(context, message: "Error occured");
    });
  }
}
