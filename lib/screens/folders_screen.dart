import 'package:flutter/material.dart';
import 'package:place/data/folders_data.dart';
import 'package:place/models/folder.dart';
import 'package:place/screens/places.dart';

import '../widget/folders_look.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() {
    return _FolderScreenState();
  }
}

class _FolderScreenState extends State<FolderScreen> {
  void _selectCategory(BuildContext context, Folder category) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const PlacesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: availablefolder.length,
        itemBuilder: (ctx, index) {
          final category = availablefolder[index];
          return FolderGird(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          );
        },
      ),
    );
  }
}
