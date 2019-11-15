import 'package:diwan/models/diwan.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminDiwanScreen extends StatefulWidget {
  @override
  _AdminDiwanScreenState createState() => _AdminDiwanScreenState();
}

class _AdminDiwanScreenState extends State<AdminDiwanScreen> {
  List<Diwan> diwanList = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    Diwan.fetchDiwanList().then((List<Diwan> list) {
      diwanList.clear();
      setState(() {
        diwanList.addAll(list);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonBackground,
        child: Image.asset(
          'images/fab_add_button.png',
          width: 25,
          height: 25,
        ),
        onPressed: () {
          Navigator.of(context)
              .pushNamed(
                '/admin/create_diwan',
              )
              .whenComplete(fetchData);
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
                  return _createItem(diwanList[index]);
                }),
          )
        ],
      ),
    );
  }

  Widget _createItem(Diwan diwan) {
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
                child: Image.network(
                  diwan.image,
                  width: 40,
                  height: 40,
                ),
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
                      diwan.name,
                      style: commentUsernameStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Created on " +
                          new DateFormat("dd/MM/yyyy").format(DateTime.now()),
                      style: commentDateStyle,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      // Tapped
                      Navigator.of(context)
                          .pushNamed('/admin/create_diwan', arguments: diwan)
                          .whenComplete(fetchData);
                    },
                    child: Container(
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.separator)),
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
                                borderRadius: BorderRadius.circular(30)),
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
