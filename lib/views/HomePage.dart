import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/widgets/ExampleWidget.dart';
import 'package:todo_list/widgets/TodoWidget.dart';
import 'package:todo_list/models/Todo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  // TODO: Add state for classes

  void handleCompletion(){
    print("COMPLETION TODO!");
  }

  void handleEdit(){
    print("EDIT TODO!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.HOMEPAGE_TITLE),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              TodoWidget(
                todo: Todo(title: "Task 1", description: "This is a description.", dateCreated: DateTime.now(),),
                onMarkComplete: handleCompletion,
                onEditClick: this.handleEdit,
              ),
            ],
          )
          // ExampleWidget(
          //   exampleVar: "My Example Var",
          // ),
          // ExampleWidget(),
        ],
      ),
    );
  }
}
