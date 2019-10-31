import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/models/Media.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MediaScreen extends StatefulWidget {
  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  List<String> categoryList = [
    "All",
    "Music Videos",
    "Live Streams",
    "Short Video"
  ];
  int activeCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [
                  const Color(0xFFDBB590),
                  const Color(0xFFA97D53),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  child: Text(
                    AppLocalization.of(context)
                        .translate('learn_about_membership'),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Segoe',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Image.asset(
                        'images/forward.png',
                        height: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return _createCategoryItem(categoryList[index], index);
                }),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
                children: List.generate(mediaList.length, (index){
                  return _createMediaItem(mediaList[index]);
                }),
          ))
        ],
      ),
    );
  }

  Widget _createCategoryItem(String category, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: index == activeCategory
                ? Colors.black
                : AppColors.settingCategoryTitle,
          )),
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      child: Text(
        category,
        style: TextStyle(
          color: index == activeCategory
              ? Colors.black
              : AppColors.settingCategoryTitle,
        ),
      ),
    );
  }

  Widget _createMediaItem(Media media) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Image.asset(media.image, width: MediaQuery.of(context).size.width / 2 - 20, height: 100,),
          ),

          Container(
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: Text(
              media.title,
              style: commentUsernameStyle,
            ),
          ),

          SizedBox(
            height: 5,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Image.asset('images/media_video.png', width: 10, height: 10,)),

              SizedBox(
                width: 5,
              ),

              Text(
                media.viewCount + " Views | " + new DateFormat("dd/MM/yyyy").format(media.createdAt),
                style: commentDateStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
