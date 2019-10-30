import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:diwan/ui/app_pager.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  // Go to setting screen
                  Navigator.of(context).pushNamed('/settings');
                },
                icon: Image.asset(
                  'images/settings.png',
                  width: 20,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Vivek Kaushik",
              style: boldTextHeading,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "email@example.com",
              style: subHeadingStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
              height: 50,
              child: AppPager(
                pagerList: ['My Diwan', 'My Post', 'Bookmarks', 'Purchase'],
                pageChanged: (index) {
                  // PageChanged
                },
              )),
        ],
      ),
    );
  }
}
