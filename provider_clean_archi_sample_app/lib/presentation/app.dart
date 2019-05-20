import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:provider_clean_archi_sample_app/domain/usecases/places/get_places_use_case.dart';
import 'package:provider_clean_archi_sample_app/presentation/home.dart';
import 'package:provider_clean_archi_sample_app/presentation/injection/modules/place_module.dart';
import 'package:provider/provider.dart';


import 'notifiers/places_notifier.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var injector = Injector.fromModule(module: PlaceModule());
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<PlacesNotifier>(
          builder: (_) => PlacesNotifier(injector.get<GetPlacesUseCase>()),
          child: HomePage(),
        ));
  }
}
