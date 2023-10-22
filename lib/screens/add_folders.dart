import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:place/models/folder.dart';


class AddFolder extends ConsumerStatefulWidget {
  const AddFolder({super.key, required this.onAddFolder});

  final Function(Folder) onAddFolder;
  @override
  ConsumerState<AddFolder> createState() {
    return _AddFolderState();
  }
}

class _AddFolderState extends ConsumerState<AddFolder> {
  final _titleController = TextEditingController();
  Color _selectedColor = Colors.blue;
  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty) {
      print('Newly added:$enteredTitle');
      return;
    }

    final newFolder = Folder(title: enteredTitle, color: _selectedColor);

    // // Now you can do something with the new folder, such as saving it to a list or database.
    // // For demonstration purposes, let's print the folder details.
    print('New Folder: ${newFolder.title}, Color: ${newFolder.color}');
    Navigator.of(context).pop();
  }

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedColor,
              onColorChanged: (color) {
                setState(() {
                  _selectedColor = color;
                });
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Folder'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text('Tiltle'),
                ),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed:
                    _openColorPicker, // Open color picker on button press
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.color_lens),
                    SizedBox(width: 8),
                    Text('Select Color'),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 50, // Adjust the size of the color box
                height: 50,
                color: _selectedColor,
              ),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Folder'),
              ),
            ],
          )),
    );
  }
}
