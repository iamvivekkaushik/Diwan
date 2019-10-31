class Media {
  String image;
  String title;
  String viewCount;
  DateTime createdAt;

  Media(this.image, this.title, this.viewCount, this.createdAt);
}

List<Media> mediaList = [
  Media('images/temp/media_1.png', 'Lorem ipsum dolor emet set proc', '2.3K', DateTime.now()),
  Media('images/temp/media_2.png', 'Lorem ipsum dolor emet set proc', '1.5K', DateTime.now()),
  Media('images/temp/media_3.png', 'Lorem ipsum dolor emet set proc', '5.6K', DateTime.now()),
  Media('images/temp/media_4.png', 'Lorem ipsum dolor emet set proc', '3.3K', DateTime.now()),
  Media('images/temp/media_1.png', 'Lorem ipsum dolor emet set proc', '2.2K', DateTime.now()),
  Media('images/temp/media_2.png', 'Lorem ipsum dolor emet set proc', '4.4K', DateTime.now()),
  Media('images/temp/media_3.png', 'Lorem ipsum dolor emet set proc', '1.6K', DateTime.now()),
  Media('images/temp/media_4.png', 'Lorem ipsum dolor emet set proc', '3.3K', DateTime.now()),
];
