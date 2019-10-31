class Post {
  String username;
  String group;
  String message;
  String image;
  DateTime createdAt;

  Post(this.username, this.group, this.message, this.image, this.createdAt);

}

List<Post> postList = [
  Post("vivek", "KPOP", "Some Message", null, DateTime.now()),
  Post("jenna", "Fasion", "Some Message", null, DateTime.now()),
  Post("elena", "Fasion", "one more message", "images/temp/discover1.png", DateTime.now()),
  Post("ron", "Entertainment", "new episodes", "images/temp/discover2.png", DateTime.now()),
  Post("aron", "Hip Hop", "Some Message", "images/temp/discover3.png", DateTime.now()),
  Post("julia", "Beauty", "Some Message", "images/temp/discover5.png", DateTime.now()),
  Post("enrique", "Entertainment", "message", null, DateTime.now()),
];
