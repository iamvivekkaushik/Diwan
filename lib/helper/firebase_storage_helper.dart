import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FStorage {
  static Future<StorageTaskSnapshot> uploadImage(File image) async {
    FirebaseStorage _storage = FirebaseStorage.instance;
    StorageReference storageRef = _storage.ref();

    StorageReference imageRef = storageRef
        .child("images/" + image.path.substring(image.path.lastIndexOf('/')));

    return await imageRef.putData(image.readAsBytesSync()).onComplete;
  }
}
