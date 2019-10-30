import 'package:diwan/models/post.dart';
import 'package:flutter/material.dart';

class GroupFeedScreen extends StatefulWidget {
  @override
  _GroupFeedScreenState createState() => _GroupFeedScreenState();
}

class _GroupFeedScreenState extends State<GroupFeedScreen> {
  List<String> topList = [
    'images/temp/feedSlider2.png',
    'images/temp/feedSlider2.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),

          Container(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: topList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Image.asset(
                      topList[index],
                      width: MediaQuery.of(context).size.width - 40,
                    ),
                  );
                }),
          ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return _createPost(postList[index]);
                }),
          ),
        ],
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
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue
              ),
              width: 40,
              height: 40,
              child: (post.image != null) ? Image.asset(post.image, fit: BoxFit.cover,) : Container(),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    post.username,
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
