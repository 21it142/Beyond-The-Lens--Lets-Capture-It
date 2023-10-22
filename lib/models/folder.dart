import 'package:flutter/material.dart';

class Folder {
  const Folder({
    required this.title,
    this.color = Colors.orange,
  });

  final String title;
  final Color color;
}
