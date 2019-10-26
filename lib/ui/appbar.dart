import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconData icon;
  final String title;

  CustomAppBar(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: Dimen.topMargin,
        ),
        title != null
            ? Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: IconButton(
                        icon: Icon(
                          icon,
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
                          title,
                          style: appBarRegTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                    )
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
