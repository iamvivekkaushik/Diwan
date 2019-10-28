import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:diwan/screens/account_screen.dart';
import 'package:diwan/screens/discover_screen.dart';
import 'package:diwan/screens/diwan_screen.dart';
import 'package:flutter/material.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

class HomepageScreen extends StatefulWidget {
  int pageIndex;

  HomepageScreen(this.pageIndex);

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 68,
        child: GradientBottomNavigationBar(
          backgroundColorStart: AppColors.navbarBackground,
          backgroundColorEnd: AppColors.navbarBackground,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Image.asset("images/nav_diwan.png", width: 18, color: AppColors.settingCategoryTitle,), title: Text('Diwan')),
            BottomNavigationBarItem(icon: Icon(DiwanIcons.discover, color: AppColors.settingCategoryTitle,), title: Text('Discover')),
            BottomNavigationBarItem(icon: Image.asset("images/nav_account.png", width: 18, color: AppColors.settingCategoryTitle,), title: Text('My')),
            BottomNavigationBarItem(icon: Icon(DiwanIcons.bell, color: AppColors.settingCategoryTitle,), title: Text('Notification')),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          fixedColor: Colors.white,
        ),
      ),
      body: _getScreen(),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget _getScreen() {
    switch(_selectedIndex) {
      case 0:
        return DiwanScreen();
      case 1:
        return DiscoverScreen();
      case 2:
        return AccountScreen();
      case 3:
        return Container();
    }
  }
}
