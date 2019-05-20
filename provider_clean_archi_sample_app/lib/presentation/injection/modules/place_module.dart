import "package:dependencies/dependencies.dart";
import 'package:provider_clean_archi_sample_app/data/datasources/remotes/place_fake_data_source.dart';
import 'package:provider_clean_archi_sample_app/data/repositories/place_data_repository_impl.dart';
import 'package:provider_clean_archi_sample_app/domain/repositories/place_repository.dart';
import 'package:provider_clean_archi_sample_app/domain/usecases/places/get_places_use_case.dart';
import 'package:provider_clean_archi_sample_app/domain/usecases/places/get_places_use_case_impl.dart';

class PlaceModule implements Module {
  @override
  void configure(Binder binder) {
    binder
      ..bindLazySingleton<PlaceRepository>(
          (i, p) => PlaceFakeDataSourceImpl(),
          name: "place_fake_data_source")
      ..bindLazySingleton<PlaceRepository>(
          (i, p) => PlaceDataRepositoryImpl(
              i.get<PlaceRepository>(name: "place_fake_data_source")),
          name: "place_repository")
      ..bindFactory<GetPlacesUseCase>((i, p) => GetPlacesUseCaseImpl(
          i.get<PlaceRepository>(name: "place_repository")));
  }
}
