import 'package:flutter/material.dart';
import 'package:place/data/folders_data.dart';
import 'package:place/models/folder.dart';
import 'package:place/screens/places.dart';
import 'package:place/widget/folders_look.dart';

class FolderList extends StatelessWidget {
  const FolderList({super.key});
  void _selectCategory(BuildContext context, Folder category) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const PlacesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: availablefolder.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(availablefolder[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(.75),
            // margin: EdgeInsets.symmetric(
            //   horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            // ),
          ),
          onDismissed: (direction) {},
          child: FolderGird(
              category: availablefolder[index],
              onSelectCategory: () {
                _selectCategory(context, availablefolder[index]);
              })),
    );
  }
}
