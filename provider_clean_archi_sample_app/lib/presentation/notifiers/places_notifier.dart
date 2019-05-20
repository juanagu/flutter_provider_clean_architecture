import 'package:flutter/material.dart';
import 'package:provider_clean_archi_sample_app/domain/models/place_model.dart';
import 'package:provider_clean_archi_sample_app/domain/usecases/places/get_places_use_case.dart';

class PlacesNotifier with ChangeNotifier {

  GetPlacesUseCase getPlacesUseCase;
  List<Place> places = new List<Place>();
  bool isLoading = false;

  PlacesNotifier(this.getPlacesUseCase);

  List<Place> getPlaces() => this.places;

  Future<void> refresh() async{
    this.places.clear();
    notifyListeners();
    await this.load();
  }

  Future<void> load() async {
    this.checkIsLoading();
    await this.loadNewPlaces();
    this.isLoading = false;
    notifyListeners();
  }

  Future loadNewPlaces() async {
    var newPlaces = await this.getPlacesUseCase.perform();
    if (newPlaces != null) {
      this.places.addAll(newPlaces);
    }
  }

  void checkIsLoading() {
    this.isLoading = this.places.isEmpty;
    notifyListeners();
  }

  getIsLoading() {
    return this.isLoading;
  }
}
