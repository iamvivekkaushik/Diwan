class User {
  String name;
  String image;
  DateTime createdAt;

  User(this.name, this.image, this.createdAt);
}

List<User> userList = [
  User("Sarah", "images/temp/person_1.png", DateTime.now()),
  User("John", "images/temp/person_2.png", DateTime.now()),
];

List<User> diwanList = [
  User("Super Junior", "images/temp/person_3.png", DateTime.now()),
  User("K Food", "images/temp/person_4.png", DateTime.now()),
];