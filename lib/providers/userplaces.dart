import 'package:place/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);
  List<Place> _deletedPlaces = [];
  void addPlace(String title, File image, PalceLocation location) {
    final newPlace = Place(title: title, image: image, location: location);

    state = [newPlace, ...state];
  }

  void deletePlace(String placeId) {
    final deletedPlace = state.firstWhere((place) => place.id == placeId);

    _deletedPlaces = [deletedPlace, ..._deletedPlaces];
    state = state.where((place) => place.id != placeId).toList();
  }

  void undoDelete() {
    if (_deletedPlaces.isNotEmpty) {
      final lastDeletedPlace = _deletedPlaces.removeLast();
      state = [lastDeletedPlace, ...state];
    }
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
