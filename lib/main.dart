import 'package:flutter/material.dart';
import 'package:flutter_custom_widgets/buttons/cutom_gradient_elevated_button.dart';

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
      home: const CustomElevatedButton(),
    );
  }
}
