// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'buttons/cutom_gradient_elevated_button.dart';
import 'gradient_views/custom_shape_gradient_gridview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomShapeGridentGridView(),
    );
  }
}
