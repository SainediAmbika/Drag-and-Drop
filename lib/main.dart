import 'package:flutter/material.dart';

import 'DragAndDrop/dandTypes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liquid Drag and Drop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const textToImageDragAndDrop(),
      home: const dandIconOptions(),
    );
  }
}
