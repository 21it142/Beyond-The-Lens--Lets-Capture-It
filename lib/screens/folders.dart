import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/models/folder.dart';
import 'package:place/models/place.dart';
//import 'package:place/providers/bookmark.dart';
import 'package:place/screens/add_folders.dart';
import 'package:place/screens/add_place.dart';
import 'package:place/screens/expenses.dart';
import 'package:place/screens/folders_screen.dart';
import 'package:place/screens/places.dart';
import 'package:place/widget/folderList.dart';
import 'package:place/widget/folders_drawer.dart';
//import 'package:place/widget/folders_look.dart';

class FoldersScreen extends ConsumerStatefulWidget {
  const FoldersScreen({super.key});

  @override
  ConsumerState<FoldersScreen> createState() {
    return _FoldersScreenState();
  }
}

class _FoldersScreenState extends ConsumerState<FoldersScreen> {
  final List<Folder> _folders = const [
    Folder(
      title: 'VIsited',
      color: Colors.purple,
    ),
    Folder(
      title: 'Yet To Visit',
      color: Colors.red,
    ),
    Folder(
      title: 'All',
      color: Colors.orange,
    ),
    Folder(
      title: 'Expensive',
      color: Colors.amber,
    ),
    Folder(
      title: 'Less Expensive',
      color: Colors.blue,
    ),
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _addFolder(Folder newFolder) {
    setState(() {
      _folders.add(newFolder); // Add the new folder to the list
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Addplace') {
      await Navigator.of(context).push<Map<Place, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const AddPlaceScreen(),
        ),
      );
    }
    if (identifier == 'PlacesScreen') {
      await Navigator.of(context).push<Map<Place, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const PlacesScreen(),
        ),
      );
    }
    if (identifier == 'Expense') {
      await Navigator.of(context).push<Map<Place, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const Expenses(),
        ),
      );
    }
  }

  void _selectCategory(BuildContext context, Folder category) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const PlacesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    // Widget availablePage = const FoldersScreen();
    Widget activePage = const FolderScreen();
    var actiPageTitle = 'Folders';

    if (_selectedPageIndex == 1) {
      //  final favoritePlace = ref.watch(favoritePlaceProvider);
      activePage = const PlacesScreen();
      actiPageTitle = 'Your Favorites';
    }
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_folders.isNotEmpty) {
      setState(() {
        mainContent = const FolderList();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(actiPageTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddFolder(
                    onAddFolder: _addFolder,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body:activePage,
      // setState(() {
      //   mainContent = ExpenseList(
      //     expenses: _registeredExpenses,
      //     onRemoveExpense: _removeExpense,
      //   );
      // });
      // Scaffold(
      //   body: GridView.builder(
      //     padding: const EdgeInsets.all(24),
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       childAspectRatio: 1.5,
      //       crossAxisSpacing: 20,
      //       mainAxisSpacing: 20,
      //     ),
      //     itemCount: availablefolder.length,
      //     itemBuilder: (ctx, index) {
      //       final category = availablefolder[index];
      //       return FolderGird(
      //         category: category,
      //         onSelectCategory: () {
      //           _selectCategory(context, category);
      //         },
      //       );
      //     },
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Folders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmrked',
          ),
        ],
      ),
    );
  }
}
