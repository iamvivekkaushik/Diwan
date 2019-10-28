class Post {
  String username;
  String group;
  String message;
  String image;

  Post(this.username, this.group, this.message, this.image);

}

List<Post> postList = [
  Post("vivek", "KPOP", "Some Message", null),
  Post("jenna", "Fasion", "Some Message", null),
  Post("elena", "Fasion", "one more message", "images/temp/discover1.png"),
  Post("ron", "Entertainment", "new episodes", "images/temp/discover2.png"),
  Post("aron", "Hip Hop", "Some Message", "images/temp/discover3.png"),
  Post("julia", "Beauty", "Some Message", "images/temp/discover5.png"),
  Post("enrique", "Entertainment", "message", null),
];
