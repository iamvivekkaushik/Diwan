import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/models/comments.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCommentScreen extends StatefulWidget {
  final String post;

  PostCommentScreen(this.post);

  @override
  _PostCommentScreenState createState() => _PostCommentScreenState();
}

class _PostCommentScreenState extends State<PostCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: Dimen.topMargin,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    icon: Icon(
                      DiwanIcons.back,
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
                      "Post title",
                      style: appBarRegTextStyle,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Divider(
              color: AppColors.separator,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: commentList.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: MediaQuery.of(context).size.width - 40,
                      child: _createComment(commentList[index]));
                }),
          )
        ],
      ),
    );
  }

  Widget _createComment(PostComment post) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Image.asset(
              post.image,
              width: 35,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                post.username,
                style: commentUsernameStyle,
              ),
              Text(
                new DateFormat("dd/MM/yyyy, HH:mm").format(post.createdAt),
                style: commentDateStyle,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  post.comment,
                  style: commentStyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'images/search_comment.png',
                    width: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    post.searches.toString(),
                    style: commentDateStyle,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    'images/chat_comment.png',
                    width: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    post.searches.toString(),
                    style: commentDateStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'images/translate.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
