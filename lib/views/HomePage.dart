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
  List<Todo> userTodos = [];

  @override
  void initState(){
    loadTodos_TEST_MODE();
    // loadTodos();

  }
  
  void loadTodos_TEST_MODE(){
    List<Todo> todos = [];
    todos.add(Todo(title: "title 1", description: "description 1", dateCreated: DateTime.now()));
    todos.add(Todo(title: "title 2", description: "description 2", dateCreated: DateTime.now().add(Duration(hours: 1))));
    todos.add(Todo(title: "title 3", description: "description 3", dateCreated: DateTime.now().add(Duration(hours: 2))));
    
    setState(() {
      userTodos = todos;
    });
  }

  void loadTodos(){
    print("loading Todos from shared_preference to state");
  }

  void saveTodos(){
    print("saving todos from current state to shared_preference");
  }

  void handleCompletion(Todo todo){
    print("COMPLETION TODO!" + todo.title);
    int todoIndex = userTodos.indexOf(todo);

    setState(() {
      userTodos[todoIndex] = Todo(title: todo.title, description: todo.description, dateCreated: todo.dateCreated, isCompleted: !todo.isCompleted);
      saveTodos();
    });
  }

  void handleEdit(Todo todo, String title, String description){
    print("EDIT TODO!");
    int todoIndex = userTodos.indexOf(todo);

    setState(() {
      userTodos[todoIndex] = Todo(title: title, description: description, dateCreated: todo.dateCreated, isCompleted: todo.isCompleted);
      saveTodos();
    });

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
            children: userTodos.map<TodoWidget>((todo){
                return TodoWidget(todo: todo, onMarkComplete: handleCompletion, onEditClick: handleEdit);
              }).toList()
          )
        ],
      ),
    );
  }
}
