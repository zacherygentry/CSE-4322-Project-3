import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
// import 'package:todo_list/widgets/EditTodoWidget.dart';
import 'package:todo_list/widgets/TodoWidget.dart';
import 'package:todo_list/models/Todo.dart';
import 'About.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> userTodos = [];

  @override
  void initState() {
    loadTodos_TEST_MODE();
    // loadTodos();
  }

  void loadTodos_TEST_MODE() {
    List<Todo> todos = [];
    todos.add(Todo(
        title: "title 1",
        description: "description 1",
        dateCreated: DateTime.now()));
    todos.add(Todo(
        title: "title 2",
        description: "description 2",
        dateCreated: DateTime.now().add(Duration(hours: 1))));
    todos.add(Todo(
        title: "title 3",
        description: "description 3",
        dateCreated: DateTime.now().add(Duration(hours: 2))));

    setState(() {
      userTodos = todos;
    });
  }

  void loadTodos() {
    print("loading Todos from shared_preference to state");
  }

  void saveTodos() {
    print("saving todos from current state to shared_preference");
  }

  void handleCompletion(Todo todo) {
    print("COMPLETION TODO!" + todo.title);
    int todoIndex = userTodos.indexOf(todo);

    setState(() {
      userTodos[todoIndex] = Todo(
          title: todo.title,
          description: todo.description,
          dateCreated: todo.dateCreated,
          isCompleted: !todo.isCompleted);
      saveTodos();
    });
  }

  void handleEdit(Todo todo, String title, String description) {
    print("EDIT TODO!");
    int todoIndex = userTodos.indexOf(todo);

    showEditBottomSheet(context, todo, todoIndex);
  }

  void handleAdd(BuildContext context){
    print("Adding item");
    DateTime dateCreated = DateTime.now();
    TextEditingController titleInputController = new TextEditingController();
    TextEditingController descriptionInputController = new TextEditingController();
    descriptionInputController.text = "";

    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (BuildContext context){
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 36,
            left: 32,
            right: 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: TextField(
                  controller: titleInputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Title",
                  ),
                  autofocus: true,
                  onSubmitted: (newVal) {
                    // user pressed enter on Title textfield
                    if(titleInputController.text.length > 0){
                      setState(() {
                        userTodos.add(
                          Todo(
                            title: titleInputController.text,
                            description: descriptionInputController.text,
                            dateCreated: dateCreated
                          )
                      );
                      saveTodos();
                      Navigator.pop(context); // close the showModalBottomSheet widget
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: descriptionInputController, // holds the text
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Description",
                  ),
                  onSubmitted: (newVal) {
                    // user pressed enter on Title textfield
                    if(titleInputController.text.length > 0){
                      setState(() {
                        userTodos.add(
                          Todo(
                            title: titleInputController.text,
                            description: descriptionInputController.text,
                            dateCreated: dateCreated
                          )
                      );
                      saveTodos();
                      Navigator.pop(context); // close the showModalBottomSheet widget
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Icon(Icons.arrow_right, size: 36),
                    color: Colors.greenAccent,
                    onPressed: () {
                      if(titleInputController.text.length > 0){
                        setState(() {
                          userTodos.add(
                            Todo(
                              title: titleInputController.text,
                              description: descriptionInputController.text,
                              dateCreated: dateCreated
                            )
                          );
                          saveTodos();
                          Navigator.pop(context); // close the showModalBottomSheet widget
                        });
                      }
                    },
                  )),
              ),
            ],
          ),
        );
      }
    );
  }

  void showEditBottomSheet(context, Todo todo, int todoIndex) {
    TextEditingController titleInputController = new TextEditingController();
    TextEditingController descriptionInputController = new TextEditingController();
    titleInputController.text = todo.title;
    descriptionInputController.text = todo.description;

    // Making a new widget for this takes time. TODO for a later date :p
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext buildContext) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(buildContext).viewInsets.bottom,
                top: 36,
                left: 32,
                right: 32),
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: TextField(
                    controller: titleInputController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Title",
                    ),
                    autofocus: true,
                    onSubmitted: (newVal) {
                      // user pressed enter on Title textfield
                      setState(() {
                        userTodos[todoIndex] = Todo(
                            title: newVal,
                            description: todo.description,
                            dateCreated: todo.dateCreated,
                            isCompleted: todo.isCompleted);
                        saveTodos();
                        Navigator.pop(
                            buildContext); // close the showModalBottomSheet widget
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: descriptionInputController, // holds the text
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Description",
                    ),
                    autofocus: true,
                    onSubmitted: (newVal) {
                      // user pressed enter on Title textfield
                      setState(() {
                        userTodos[todoIndex] = Todo(
                            title: todo.title,
                            description: newVal,
                            dateCreated: todo.dateCreated,
                            isCompleted: todo.isCompleted);
                        saveTodos();
                        Navigator.pop(
                            buildContext); // close the showModalBottomSheet widget
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Icon(Icons.arrow_right, size: 36),
                        color: Colors.greenAccent,
                        onPressed: () {
                          setState(() {
                            userTodos[todoIndex] = Todo(
                                title: titleInputController.text,
                                description: descriptionInputController.text,
                                dateCreated: todo.dateCreated,
                                isCompleted: todo.isCompleted);
                            saveTodos();
                            Navigator.pop(
                                buildContext); // close the showModalBottomSheet widget
                          });
                        },
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
      children: userTodos.map<TodoWidget>((todo) {
        return TodoWidget(
          todo: todo,
          onMarkComplete: handleCompletion,
          onEditClick: handleEdit);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          handleAdd(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
  //   return 
  //   );
  // }
}
