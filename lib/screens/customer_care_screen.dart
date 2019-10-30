import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:diwan/ui/appbar.dart';
import 'package:flutter/material.dart';

class CustomerCareScreen extends StatefulWidget {
  @override
  _CustomerCareScreenState createState() => _CustomerCareScreenState();
}

class _CustomerCareScreenState extends State<CustomerCareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomAppBar(AppLocalization.of(context).translate('customer_care'), DiwanIcons.back),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: new Border.all(color: AppColors.textFieldBorder),
              ),
            child: InkWell(
                onTap: () {
                  // ToDo: Do something here
                  Navigator.of(context).pushNamed('/supportScreen');
                },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(DiwanIcons.chatIcon),
                    SizedBox(width: 10,),
                    Text(AppLocalization.of(context).translate('one_one_support'),
                    style: commentUsernameStyle,)
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
