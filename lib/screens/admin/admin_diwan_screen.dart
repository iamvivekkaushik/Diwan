import 'package:diwan/models/user.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:diwan/ui/user_list_item.dart';
import 'package:flutter/material.dart';

class AdminDiwanScreen extends StatefulWidget {
  @override
  _AdminDiwanScreenState createState() => _AdminDiwanScreenState();
}

class _AdminDiwanScreenState extends State<AdminDiwanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonBackground,
        child: Image.asset('images/fab_add_button.png', width: 25, height: 25,),
        onPressed: () {
          Navigator.of(context).pushNamed('/admin/create_diwan');
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Created " + diwanList.length.toString() + " Diwan",
              style: subHeadingStyle,
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: diwanList.length,
                itemBuilder: (context, index) {
                  return UserListItem(diwanList[index]);
                }),
          )
        ],
      ),
    );
  }
}
