import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/models/post.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<String> _dropdownList = ['Entertainment'];
  String dropdownValue = "Entertainment";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: Dimen.topMargin + 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              AppLocalization.of(context).translate('discover'),
              style: boldTextHeading,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.searchBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      AppLocalization.of(context).translate('search'),
                  hintStyle: searchHintStyle,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.settingCategoryTitle,
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppLocalization.of(context).translate('trending_post'),
                      maxLines: 1,
                      style: trendingTextStyle,
                    ),
                    Text(
                      "10/01/2019  09:00 - 09:30",
                      maxLines: 1,
                      style: trendingDateTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.discoverDropdownBg,
                      borderRadius: BorderRadius.circular(8)),
                  width: MediaQuery.of(context).size.width / 2 - 60,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      isExpanded: true,
                      icon: Image.asset(
                        "images/dropdown_icon.png",
                        width: 11,
                        height: 6,
                      ),
                      style:
                          TextStyle(fontFamily: 'Segoe', color: Colors.black),
                      underline: Container(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items:
                          //ToDo: Change with real List
                          _dropdownList
                              .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Divider(
              color: AppColors.separator,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        _createList(
                            postList[index], index + 1, Color(0xFFEE8168)),
                        Divider(
                          color: AppColors.separator,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _createList(Post post, int index, Color color) {
    return Container(
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            index.toString(),
            style: discoverListIndexStyle,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: color),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      post.username,
                      style: discoverItemPathStyle,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                      child: Image.asset(
                        "images/triangle.png",
                        color: AppColors.textFieldBorder,
                        width: 5,
                      ),
                    ),
                    Text(
                      post.group,
                      style: discoverItemPathStyle,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    post.message,
                    style: discoverItemHeadingStyle,
                  ),
                )
              ],
            ),
          ),
          post.image != null
              ? Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: 80,
                      child: Image.asset(
                        post.image,
                        width: 80,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
