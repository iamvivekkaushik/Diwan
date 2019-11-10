import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diwan/helper/firebase_storage_helper.dart';
import 'package:diwan/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Diwan {
  String id;
  String name;
  String image;
  List<User> officials;
  List<User> followers;

  Diwan({this.id, this.name, this.image, this.officials, this.followers});

  Diwan.fromDocumentSnap(DocumentSnapshot document) {
    id = document.documentID;
    name = document.data['name'];
    image = document.data['image'];
    officials = [];
    followers = [];
  }

  static Future<void> createDiwan(Diwan diwan, File image) async {
    Firestore _db = Firestore.instance;
    DocumentReference ref = _db.collection('diwans').document();

    dynamic url;

    if(image != null) {
      StorageTaskSnapshot imageUrl = await FStorage.uploadImage(image);
      url = await imageUrl.ref.getDownloadURL();
    } else {
      url = diwan.image;
    }

    Map<String, dynamic> data = {
      'name': diwan.name,
      'image': url.toString(),
      'officials': diwan.officials,
      'followers': diwan.followers,
    };

    await ref.setData(data, merge: true);
  }

  static Future<List<Diwan>> fetchDiwanList() async {
    Firestore _db = Firestore.instance;
    CollectionReference ref = _db.collection('diwans');

    List<Diwan> diwanList = [];

    QuerySnapshot querySnap = await ref.getDocuments();

    querySnap.documents.forEach((document) {
      diwanList.add(Diwan.fromDocumentSnap(document));
    });

    return diwanList;
  }

  static Future<void> updateDiwan(Diwan diwan, File image) async {
    Firestore _db = Firestore.instance;
    DocumentReference ref = _db.collection('diwans').document(diwan.id);

    dynamic url;

    if(image != null) {
      StorageTaskSnapshot imageUrl = await FStorage.uploadImage(image);
      url = await imageUrl.ref.getDownloadURL();
    } else {
      url = diwan.image;
    }

    Map<String, dynamic> data = {
      'name': diwan.name,
      'image': url.toString(),
      'officials': diwan.officials,
      'followers': diwan.followers,
    };

    return ref.updateData(data);
  }
}
