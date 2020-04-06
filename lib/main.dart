import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/views/TabScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_TITLE,
      theme: ThemeData.dark(),
      home: TabScreen(),
    );
  }
}
