import 'dart:async';

import 'package:provider_clean_archi_sample_app/domain/models/place_model.dart';
import 'package:provider_clean_archi_sample_app/domain/repositories/place_repository.dart';

class PlaceFakeDataSourceImpl implements PlaceRepository {
  @override
  Future<List<Place>> getAll() async {
    var places = new List<Place>();
    places.add(Place.newInstance(1, "Juan", "photo"));
    places.add(Place.newInstance(2, "Ignacio", "photo"));
    places.add(Place.newInstance(3, "Agu", "photo"));
    places.add(Place.newInstance(1, "Juan", "photo"));
    places.add(Place.newInstance(2, "Ignacio", "photo"));
    places.add(Place.newInstance(3, "Agu", "photo"));
    places.add(Place.newInstance(1, "Juan", "photo"));
    places.add(Place.newInstance(2, "Ignacio", "photo"));
    places.add(Place.newInstance(3, "Agu", "photo"));
    places.add(Place.newInstance(1, "Juan", "photo"));
    places.add(Place.newInstance(2, "Ignacio", "photo"));
    places.add(Place.newInstance(3, "Agu", "photo"));
    places.add(Place.newInstance(1, "Juan", "photo"));
    places.add(Place.newInstance(2, "Ignacio", "photo"));
    places.add(Place.newInstance(3, "Agu", "photo"));
    places.add(Place.newInstance(1, "Juan", "photo"));
    places.add(Place.newInstance(2, "Ignacio", "photo"));
    places.add(Place.newInstance(3, "Agu", "photo"));
    return new Future.delayed(const Duration(seconds: 3), () => places);
  }
}
