class PostComment {
  String username;
  String image;
  String userId;
  String comment;
  DateTime createdAt;
  int searches;
  int reply;

  PostComment(this.username, this.image, this.userId, this.comment,
      this.createdAt, this.searches, this.reply);
}

List<PostComment> commentList = [
  PostComment('johndoe', 'images/temp/person_1.png', '1', 'The Quick', DateTime.now(), 1, 1),
  PostComment('johneric', 'images/temp/person_2.png', '2', 'This is amazing', DateTime.now(), 1, 1),
  PostComment('rossgeller', 'images/temp/person_3.png', '3', 'looks great', DateTime.now(), 1, 1),
  PostComment('iansomer', 'images/temp/person_4.png', '4', 'This is perfect', DateTime.now(), 1, 1),
];
