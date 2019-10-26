import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/nav_diwan.png',
                height: 35,
              ),
              title: Text('Diwan'),
              backgroundColor: AppColors.navbarBackground),
          BottomNavigationBarItem(
              icon: Icon(DiwanIcons.discover),
              title: Text('Discover'),
              backgroundColor: AppColors.navbarBackground),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/nav_account.png',
                height: 28,
                color: Colors.black,
              ),
              title: Text('My'),
              backgroundColor: AppColors.navbarBackground),
          BottomNavigationBarItem(
              icon: Icon(DiwanIcons.bell),
              title: Text('Notification'),
              backgroundColor: AppColors.navbarBackground)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.separator,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
