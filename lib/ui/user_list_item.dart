import 'package:diwan/models/user.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserListItem extends StatelessWidget {
  final User user;

  UserListItem(this.user);

  @override
  Widget build(BuildContext context) {
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

              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 50,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.separator)
                    ),
                    padding: EdgeInsets.all(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 10,
                          height: 10,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: AppColors.buttonBackground,
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),

                        SizedBox(
                          width: 5,
                        ),

                        Text(
                          "Edit",
                          style: subHeadingStyle,
                        )
                      ],
                    ),
                  ),
                ),
              )
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
