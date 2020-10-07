import 'package:flutter/foundation.dart' as foundation;
import 'package:zootracker/Model/Animal.dart';
import 'package:zootracker/Repository/ZootrackerRepository.dart';

class SearchViewModel extends foundation.ChangeNotifier {
  List<AnimalCellViewModel> _animalCellViewModels;
  final Animal animalQuery;

  SearchViewModel({this.animalQuery});

  void loadAnimals() {
    ZootrackerRepository.getAllAnimals().then((value) {
      _animalCellViewModels =
          value.map((e) => AnimalCellViewModel(animal: e)).toList();
      notifyListeners();
    });
  }

  List<AnimalCellViewModel> getAnimalCellViewModels() {
    if (_animalCellViewModels == null) {
      return [];
    } else {
      if (animalQuery != null) {
        return _getAnimalsFiltered().toList();
      } else {
        return _animalCellViewModels;
      }
    }
  }

  List<AnimalCellViewModel> search(String searchTerms) {
    return getAnimalCellViewModels().where((viewModel) {
      return viewModel.animal.nome
          .toLowerCase()
          .contains(searchTerms.toLowerCase());
    }).toList();
  }

  List<AnimalCellViewModel> _getAnimalsFiltered() {
    return _animalCellViewModels.where((model) => (
            (animalQuery.pegada.numDigitos == null || animalQuery.pegada.numDigitos == model.animal.pegada.numDigitos) &&
            (animalQuery.pegada.formDigitos == null) || animalQuery.pegada.formDigitos.contains(model.animal.pegada.formDigitos) &&
            (animalQuery.pegada.presGarras == null) || animalQuery.pegada.presGarras == model.animal.pegada.presGarras) &&
            (animalQuery.pegada.ordTax == null) || animalQuery.pegada.ordTax.contains(model.animal.pegada.ordTax) &&
            (animalQuery.localizacao.estado == null) || animalQuery.localizacao.estado.contains(model.animal.localizacao.estado));
  }

  AnimalCellViewModel getProductById(String id) {
    return getAnimalCellViewModels()
        .firstWhere((element) => element.animal.id == id);
  }

  List<AnimalCellViewModel> getAnimalsByIds(List<String> ids) {
    var result = ids.map((e) => getProductById(e)).toList();
    notifyListeners();

    return result;
  }
}

class AnimalCellViewModel extends foundation.ChangeNotifier {
  final Animal animal;

  AnimalCellViewModel({this.animal});
}
