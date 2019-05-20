import 'package:provider_clean_archi_sample_app/domain/models/place_model.dart';
import 'package:provider_clean_archi_sample_app/domain/repositories/place_repository.dart';

class PlaceDataRepositoryImpl implements PlaceRepository{

  PlaceRepository placeFirebaseDataSource;

  PlaceDataRepositoryImpl(this.placeFirebaseDataSource);

  @override
  Future<List<Place>> getAll() {
    return this.placeFirebaseDataSource.getAll();
  }
}