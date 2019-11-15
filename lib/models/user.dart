import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String email;
  String image;
  String country;
  bool isAdmin;
  bool linkedGoogle;
  bool linkedTwitter;
  DateTime createdAt;


  User({this.id, this.name, this.email, this.image, this.country, this.isAdmin,
      this.linkedGoogle, this.linkedTwitter, this.createdAt});

  User.fromDocument(DocumentSnapshot document) {
    id = document.data['uid'];
    name = document.data['displayName'];
    email = document.data['email'];
    image = document.data['photoURL'];
    country = document.data['country'];
    isAdmin = document.data['isAdmin'];
    linkedGoogle = document.data['linkedGoogle'];
    linkedTwitter = document.data['linkedTwitter'];
    createdAt = document.data['lastSeen'].toDate();
  }
}

List<User> userList = [
  User(name: "Sarah", image: "images/temp/person_1.png", createdAt: DateTime.now()),
  User(name: "John", image: "images/temp/person_2.png", createdAt: DateTime.now()),
];

List<User> diwanList = [
  User(name: "Super Junior", image: "images/temp/person_3.png", createdAt: DateTime.now()),
  User(name: "K Food", image: "images/temp/person_4.png", createdAt: DateTime.now()),
];