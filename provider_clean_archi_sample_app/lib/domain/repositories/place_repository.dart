import 'package:provider_clean_archi_sample_app/domain/models/place_model.dart';

abstract class PlaceRepository{
  Future<List<Place>> getAll();
}