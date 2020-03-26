import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/widgets/ExampleWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.HOMEPAGE_TITLE),
      ),
      body: ListView(
        children: <Widget>[
          ExampleWidget(
            exampleVar: "My Example Var",
          ),
          ExampleWidget(),
        ],
      ),
    );
  }
}
