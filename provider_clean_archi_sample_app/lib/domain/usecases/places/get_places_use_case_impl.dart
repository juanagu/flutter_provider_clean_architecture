import 'package:provider_clean_archi_sample_app/domain/models/place_model.dart';
import 'package:provider_clean_archi_sample_app/domain/repositories/place_repository.dart';
import 'package:provider_clean_archi_sample_app/domain/usecases/places/get_places_use_case.dart';


class GetPlacesUseCaseImpl implements GetPlacesUseCase {
  PlaceRepository placeRepository;

  GetPlacesUseCaseImpl(this.placeRepository);

  @override
  Future<List<Place>> perform() {
    return this.placeRepository.getAll();
  }
}