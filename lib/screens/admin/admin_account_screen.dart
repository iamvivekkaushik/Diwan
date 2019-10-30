import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:diwan/screens/admin/admin_diwan_screen.dart';
import 'package:diwan/screens/admin/admin_user_screen.dart';
import 'package:diwan/screens/admin/trends_screen.dart';
import 'package:diwan/ui/app_pager.dart';
import 'package:flutter/material.dart';

class AdminAccountScreen extends StatefulWidget {
  @override
  _AdminAccountScreenState createState() => _AdminAccountScreenState();
}

class _AdminAccountScreenState extends State<AdminAccountScreen> {
  Widget currentPage = AdminDiwanScreen();

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
              "Admin",
              style: boldTextHeading,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "admin@example.com",
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
                pagerList: ['Diwan', 'Post', 'User', 'Trend'],
                fitWidth: true,
                pageChanged: (index) {
                  // PageChanged
                  setState(() {
                    currentPage = _getCurrentScreen(index);
                  });
                },
              )),
          
          Expanded(child: currentPage)
        ],
      ),
    );
  }

  Widget _getCurrentScreen(int index) {
    switch(index) {
      case 0:
        return AdminDiwanScreen();
      case 1:
        return Container();
      case 2:
        return AdminUserScreen();
      case 3:
        return TrendScreen();
      default:
        return Container();
    }
  }
}
