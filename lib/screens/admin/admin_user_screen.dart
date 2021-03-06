import 'package:diwan/models/user.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:diwan/ui/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AdminUserScreen extends StatefulWidget {
  @override
  _AdminUserScreenState createState() => _AdminUserScreenState();
}

class _AdminUserScreenState extends State<AdminUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonBackground,
        child: Image.asset('images/fab_add_button.png', width: 25, height: 25,),
        onPressed: () {
          Navigator.of(context).pushNamed('/admin/create_user');
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Created " + userList.length.toString() + " Users",
              style: subHeadingStyle,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
                itemBuilder: (context, index) {
              return UserListItem(userList[index]);
            }),
          )
        ],
      ),
    );
  }
}

