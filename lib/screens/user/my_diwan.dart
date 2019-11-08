import 'package:diwan/models/user.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:diwan/ui/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDiwanScreen extends StatefulWidget {
  @override
  _MyDiwanScreenState createState() => _MyDiwanScreenState();
}

class _MyDiwanScreenState extends State<MyDiwanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Joined " + diwanList.length.toString() + " Diwan",
              style: subHeadingStyle,
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: diwanList.length,
                itemBuilder: (context, index) {
                  return _diwanList(diwanList[index]);
                }),
          )
        ],
      ),
    );
  }

  Widget _diwanList(User user) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(user.image, width: 40, height: 40,),
              ),

              SizedBox(
                width: 5,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      user.name,
                      style: commentUsernameStyle,
                    ),
                  ),

                  Container(
                    child: Text(
                      "Joined on" + new DateFormat("dd/MM/yyyy").format(user.createdAt),
                      style: commentDateStyle,
                    ),
                  )
                ],
              ),

            ],
          ),

          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Divider(
              color: AppColors.separator,
            ),
          )
        ],
      ),
    );
  }
}
