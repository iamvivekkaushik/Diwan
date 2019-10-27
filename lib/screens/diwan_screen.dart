import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class DiwanScreen extends StatefulWidget {
  @override
  _DiwanScreenState createState() => _DiwanScreenState();
}

class _DiwanScreenState extends State<DiwanScreen> {
  String dropdownValue = "ERES";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: Dimen.topMargin + 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              AppLocalization.of(context).translate('diwan'),
              style: diwanLogoStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              AppLocalization.of(context).translate('diwan_welcome_message'),
              style: boldTextHeading,
            ),
          ),
          Container(
            height: 300,
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Image.asset('images/temp/diwan_photo_${index+1}.png',
                      width: MediaQuery.of(context).size.width * .7,),
                    ),
                  );
                }),
          ),


          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Image.asset(
                "images/dropdown_icon.png",
                width: 11,
                height: 6,
                color: AppColors.separator,
              ),
              style: TextStyle(fontFamily: 'Segoe', color: AppColors.separator),
              underline: Container(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items:
              ["ERES"].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value + " "),
                );
              }).toList(),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                // Go to Privacy screen
                Navigator.of(context).pushNamed('/privacy');
              },
              child: Text(
                  AppLocalization.of(context).translate('privacy_policy') + " | " +
                      AppLocalization.of(context).translate('terms_of_use') + " | " +
                      AppLocalization.of(context).translate('terms_of_operation') + "\n" +
                      AppLocalization.of(context).translate('terms_of_use_for_paid'),
                  style: subHeadingStyle,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
