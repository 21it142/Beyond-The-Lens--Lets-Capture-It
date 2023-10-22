import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/models/place.dart';

class FavoritePlaceNotifier extends StateNotifier<List<Place>> {
  FavoritePlaceNotifier() : super([]);

  bool toggleBookmarkStatus(Place place) {
    final placebookmarked = state.contains(place);

    if (placebookmarked) {
      state = state.where((m) => m.id != place.id).toList();
      return false;
    } else {
      state = [...state, place];
      return true;
    }
    // state = [];
  }
}

final favoritePlaceProvider =
    StateNotifierProvider<FavoritePlaceNotifier, List<Place>>((ref) {
  return FavoritePlaceNotifier();
});
