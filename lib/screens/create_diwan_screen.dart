import 'dart:io';

import 'package:diwan/helper/app_localization.dart';
import 'package:diwan/helper/diwan_icons.dart';
import 'package:diwan/helper/helper.dart';
import 'package:diwan/models/diwan.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/dimen.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreateDiwanScreen extends StatefulWidget {
  final Object data;

  CreateDiwanScreen(this.data);

  @override
  _CreateDiwanScreenState createState() => _CreateDiwanScreenState();
}

class _CreateDiwanScreenState extends State<CreateDiwanScreen> {
  BuildContext snackContext;
  Diwan diwan;
  TextEditingController _nameController = new TextEditingController();
  String selectedOfficial = "John Doe";
  List<String> officialsList = [
    'John Doe',
  ];
  File _image;

  @override
  void initState() {
    if (widget.data == null) {
      diwan = Diwan(
        name: "",
        image: "",
      );
    } else {
      diwan = widget.data;
      _nameController.text = diwan.name;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        snackContext = context;
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: Dimen.topMargin,
              ),
              Container(
                height: 50,
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
                          "Diwan Creation",
                          style: announcementAppBarStyle,
                        ),
                      ),
                    ),
                    Container(
                      width: 42,
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppLocalization.of(context).translate('diwan'),
                      style: TextStyle(
                          color: AppColors.buttonBackground,
                          fontFamily: 'Segoe',
                          fontWeight: FontWeight.w400,
                          fontSize: 30),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: PopupMenuButton(
                          itemBuilder: (context) {
                            var list = List<PopupMenuEntry<Object>>();
                            list.add(
                              PopupMenuItem(
                                child: Text("Delete"),
                                value: 1,
                              ),
                            );
                            return list;
                          },
                          icon: Icon(Icons.menu, color: AppColors.buttonBackground,),
                          onSelected: (value) {
                            _deleteDiwan();
                          },
                        )
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Divider(
                  color: AppColors.separator,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "My > Create Diwan",
                  style: subHeadingStyle,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.searchBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: searchHintStyle,
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.settingCategoryTitle,
                      )),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  AppLocalization.of(context).translate('create_new_diwan'),
                  style: textHeadingStyle2,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  AppLocalization.of(context).translate('name_of_diwan_text'),
                  style: inputLabelStyle,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: new Border.all(color: AppColors.textFieldBorder)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: textFieldStyle,
                  onChanged: (value) {
                    setState(() {
                      diwan.name = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalization.of(context).translate('choose_officials'),
                      style: inputLabelStyle,
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Segoe',
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: new Border.all(color: AppColors.textFieldBorder)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: DropdownButton<String>(
                    value: selectedOfficial,
                    iconEnabledColor: AppColors.separator,
                    style: TextStyle(fontFamily: 'Segoe', color: Colors.black),
                    isExpanded: true,
                    underline: Container(),
                    items: officialsList.map((String val) {
                      return new DropdownMenuItem<String>(
                        value: val,
                        child: new Text(val),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      this.setState(() {
                        selectedOfficial = newVal;
                      });
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  AppLocalization.of(context).translate('diwan_picture'),
                  style: inputLabelStyle,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: new Border.all(color: AppColors.textFieldBorder)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: () => getImage(),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'images/attachment.png',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppLocalization.of(context).translate("add_files") +
                              " ",
                          style: attachmentYellowTextStyle,
                        ),
                        Text(
                          AppLocalization.of(context)
                              .translate("or_drop_files"),
                          style: attachmentTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: RaisedButton(
                  onPressed: () => _createDiwan(),
                  color: AppColors.buttonBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(7),
                  ),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width - 70,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalization.of(context).translate('submit'),
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<void> getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void _createDiwan() {
    if (diwan.name.isEmpty ||
        selectedOfficial.isEmpty ||
        (diwan.image.isEmpty && _image == null)) {
      createSnackbar(snackContext,
          message: "Fill All the fields", onPressed: () {});
      return;
    }

    if (widget.data == null) {
      loadingDialog(context, "Creating New Diwan");
      Diwan.createDiwan(diwan, _image).then((value) {
        Navigator.of(context)..pop()..pop();
      }).catchError((error) {
        Navigator.pop(context);
      });
    } else {
      loadingDialog(context, "Updating Diwan");
      Diwan.updateDiwan(diwan, _image).then((value) {
        Navigator.of(context)..pop()..pop();
      }).catchError((error) {
        Navigator.pop(context);
      });
    }
  }

  void _deleteDiwan() {
    if (widget.data == null) {
      Navigator.of(context).pop();
      return;
    }

    loadingDialog(context, "Deleting Diwan");
    Diwan.deleteDiwan(diwan).then((onValue) {
      Navigator.of(context)..pop()..pop();
    }).catchError((onError) {
      Navigator.of(context).pop();
      Fluttertoast.showToast(
        msg: "Couldn't delete Diwan",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
      );
    });
  }
}
