import 'package:flutter/material.dart';
import 'package:provider_clean_archi_sample_app/domain/models/place_model.dart';
import 'package:provider_clean_archi_sample_app/presentation/notifiers/places_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final places = Provider.of<PlacesNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: buildBody(places),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: places.load,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }

  Widget buildBody(PlacesNotifier places) {
    if (places.getIsLoading()) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return RefreshIndicator(
        child: buildListView(places),
        onRefresh: places.refresh,
      );
    }
  }

  ListView buildListView(PlacesNotifier places) {
    return ListView(
          children:
              places.getPlaces().map((Place p) => buildItem(p)).toList());
  }

  Widget buildItem(Place place) {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        children: <Widget>[
          new Image.network(
            'http://via.placeholder.com/200x100?text=Item${place.id}',
            width: 200.0,
            height: 100.0,
          ),
          new Expanded(child: new Text(place.name))
        ],
      ),
    );
  }
}
