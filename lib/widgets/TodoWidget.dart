import 'package:flutter/material.dart';
import '../models/Todo.dart';


class TodoWidget extends StatelessWidget {
  final Todo todo;
  final Function(Todo, String, String) onEditClick;
  final Function(Todo) onMarkComplete;

  
  const TodoWidget({
    this.todo,
    this.onEditClick,
    this.onMarkComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // color: Colors.red
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 24),
                  child: InkResponse(
                    onTap: (){onMarkComplete(todo);},
                    radius: 24,
                    child: Container(
                      width: 32,
                      height: 32,
                      child: todo.isCompleted ? Icon(Icons.check) : null,
                      decoration: BoxDecoration(
                        color: todo.isCompleted ? Colors.blue : Color(0),
                        border: Border.all(
                          width: 2.5,
                          color: Colors.black38//Color(0xFF757575)
                        ),
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        todo.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),
                      ),
                      SizedBox(height: 4,),
                      Container(
                        width: 200, 
                        child: Text(todo.description)
                      ),
                    ],
                  ),
                ),
                
                InkWell(
                  onTap: (){this.onEditClick(todo, todo.title, todo.description);},
                  child: Container(
                    width: 52,
                    height: 48,
                    child: Icon(
                      Icons.edit,
                    ),
                  ),
                )

          ],),
        ),
      )
    );
  }
}
