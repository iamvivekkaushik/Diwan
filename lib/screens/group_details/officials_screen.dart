import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/models/post.dart';
import 'package:diwan/models/story.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OfficialsScreen extends StatefulWidget {
  @override
  _OfficialsScreenState createState() => _OfficialsScreenState();
}

class _OfficialsScreenState extends State<OfficialsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 110,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storyList.length,
                itemBuilder: (context, index) {
                  Story story = storyList[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset(
                            story.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: 50,
                          child: Center(
                            child: Text(
                              story.username,
                              style: inputLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: _createPost(postList[index]));
                }),
          ),
        ],
      ),
    );
  }

  Widget _createPost(Post post) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: 40,
              height: 40,
              child: (post.image != null)
                  ? Image.asset(
                      post.image,
                      fit: BoxFit.cover,
                    )
                  : Container(),
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
                    post.username,
                    style: feedItemUsernameStyle,
                  ),
                ),
                Text(
                  new DateFormat("dd/MM/yyyy, HH:mm").format(post.createdAt),
                  style: commentDateStyle,
                )
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Text(
            post.message,
            style: subHeadingStyle,
          ),
        ),
        post.image != null
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Image.asset(
                  post.image,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ))
            : Container(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                DiwanIcons.searchIcon,
                color: AppColors.separator,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "20k+",
                style: feedIconTextStyle,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                DiwanIcons.chatIcon,
                color: AppColors.separator,
              ),
              SizedBox(
                width: 5,
              ),
              Text("15k+", style: feedIconTextStyle),
            ],
          ),
        )
      ],
    );
  }
}
