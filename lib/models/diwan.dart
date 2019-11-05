import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diwan/helper/firebase_storage_helper.dart';
import 'package:diwan/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Diwan {
  String name;
  File image;
  List<User> officials;
  List<User> followers;

  Diwan({this.name, this.image, this.officials, this.followers});

  static Future<void> createDiwan(Diwan diwan) async {
    Firestore _db = Firestore.instance;
    DocumentReference ref = _db.collection('diwans').document();

    StorageTaskSnapshot imageUrl = await FStorage.uploadImage(diwan.image);

    dynamic url = await imageUrl.ref.getDownloadURL();

    Map<String, dynamic> data = {
      'name': diwan.name,
      'image': url.toString(),
      'officials': diwan.officials,
      'followers': diwan.followers,
    };

    await ref.setData(data, merge: true);

    print("created Diwan");
  }
}