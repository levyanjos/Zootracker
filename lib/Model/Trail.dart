import 'package:flutter/foundation.dart' as foundation;

class Trail {
  final String bannerImage;
  final String title;
  final DateTime date;

  const Trail({this.bannerImage, this.title, this.date});
}

class TrailRepository {
  static var mockTrails = <Trail>[
    Trail(bannerImage: "", title: "Forest - 1", date: DateTime.now()),
    Trail(bannerImage: "", title: "Forest - 2", date: DateTime.now()),
    Trail(bannerImage: "", title: "Forest - 3", date: DateTime.now())
  ];
}

class TrailsViewModel extends foundation.ChangeNotifier {
  List<TrailCellViewModel> _trailCellsViewModel;

  void loadTrails() {
    _trailCellsViewModel = TrailRepository.mockTrails.map((e) => TrailCellViewModel(trail: e)).toList();
    notifyListeners();
  }

  List<TrailCellViewModel> getTrailCellsViewModel() {
    if (_trailCellsViewModel == null) {
      return [];
    } else {
      return _trailCellsViewModel;
    }
  }

  List<TrailCellViewModel> search(String searchTerms) {
    return getTrailCellsViewModel().where((product) {
      return product.trail.title.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }
}

class TrailCellViewModel extends foundation.ChangeNotifier {

  final Trail trail;
  TrailCellViewModel({this.trail}) : assert(trail != null);

}