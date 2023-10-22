import 'package:place/providers/userplaces.dart';
// import 'package:place/screens/add_place.dart';
import 'package:place/widget/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        // actions: [
        //   // IconButton(
        //   //   onPressed: () {
        //   //     Navigator.of(context).push(
        //   //       MaterialPageRoute(
        //   //         builder: (ctx) => const AddPlaceScreen(),
        //   //       ),
        //   //     );
        //   //   },
        //   //   icon: const Icon(Icons.add),
        //   // ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(
          places: userPlaces,
          onDelete: (placeId) {
            final notifier = ref.read(userPlacesProvider.notifier);
            final place = userPlaces.firstWhere((place) => place.id == placeId);
            //  ref.read(userPlacesProvider.notifier).deletePlace(placeId);

            notifier.deletePlace(placeId);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Place deleted'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    notifier.undoDelete();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
