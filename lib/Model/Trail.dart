
class Trail {
  String bannerImage;
  String title;
  DateTime date;

  Trail({this.bannerImage, this.title, this.date});
}

var mockTrails = <Trail>[
  Trail(bannerImage: "", title: "Forest - 1", date: DateTime.now()),
  Trail(bannerImage: "", title: "Forest - 2", date: DateTime.now()),
  Trail(bannerImage: "", title: "Forest - 3", date: DateTime.now())
];