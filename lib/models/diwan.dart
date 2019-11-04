import 'package:diwan/models/user.dart';

class Diwan {
  String name;
  String image;
  String type;
  List<User> officials;
  List<User> followers;

  Diwan(this.name, this.image, this.type, this.officials, this.followers);
}