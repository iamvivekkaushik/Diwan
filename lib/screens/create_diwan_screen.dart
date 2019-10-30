import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class CreateDiwanScreen extends StatefulWidget {
  @override
  _CreateDiwanScreenState createState() => _CreateDiwanScreenState();
}

class _CreateDiwanScreenState extends State<CreateDiwanScreen> {
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
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                  Expanded(
                    child: Center(
                      child: Text(
                        "Diwan Creation",
                        style: announcementAppBarStyle,
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
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalization.of(context).translate('diwan'),
                    style: TextStyle(
                        color: AppColors.buttonBackground,
                        fontFamily: 'Segoe',
                        fontWeight: FontWeight.w400,
                        fontSize: 30
                    ),
                  ),

                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: InkWell(
                              onTap: () {},
                              child: Image.asset('images/drag.png', width: 20,))),
                    ),
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
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "My > Create Diwan",
                style: subHeadingStyle,
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.searchBackground,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                    "Search",
                    hintStyle: searchHintStyle,
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.settingCategoryTitle,
                    )),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                AppLocalization.of(context).translate('create_new_diwan'),
                style: textHeadingStyle2,
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                AppLocalization.of(context).translate('name_of_diwan_text'),
                style: inputLabelStyle,
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: new Border.all(color: AppColors.textFieldBorder)),
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: textFieldStyle,
              ),
            ),

            SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    AppLocalization.of(context).translate('choose_officials'),
                    style: inputLabelStyle,
                  ),
                  Text(
                    "*",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Segoe',
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ),
                ],
              ),
            ),


            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: new Border.all(color: AppColors.textFieldBorder)),
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: textFieldStyle,
              ),
            ),

            SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                AppLocalization.of(context).translate('diwan_picture'),
                style: inputLabelStyle,
              ),
            ),


            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: new Border.all(color: AppColors.textFieldBorder)),
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: textFieldStyle,
              ),
            ),

            SizedBox(
              height: 70,
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: RaisedButton(
                onPressed: () {
                },
                color: AppColors.buttonBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(7),
                ),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width - 70,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalization.of(context).translate('submit'),
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
