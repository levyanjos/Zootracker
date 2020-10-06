import 'package:flutter/foundation.dart' as foundation;
import 'package:zootracker/Model/Animal.dart';
import 'package:zootracker/Repository/ZootrackerRepository.dart';

class SearchViewModel extends foundation.ChangeNotifier {
  List<AnimalCellViewModel> _animalCellViewModels;

  void loadAnimals() {
    ZootrackerRepository.getAllAnimals().then((value) {
      _animalCellViewModels = value.map((e) => AnimalCellViewModel(animal: e)).toList();
      notifyListeners();
    });
  }

  List<AnimalCellViewModel> getAnimalCellViewModels() {
    if (_animalCellViewModels == null) {
      return [];
    } else {
      return _animalCellViewModels;
    }
  }

  List<AnimalCellViewModel> search(String searchTerms) {
    return getAnimalCellViewModels().where((viewModel) {
      return viewModel.animal.nome
          .toLowerCase()
          .contains(searchTerms.toLowerCase());
    }).toList();
  }
}

class AnimalCellViewModel extends foundation.ChangeNotifier {
  final Animal animal;

  AnimalCellViewModel({this.animal});
}