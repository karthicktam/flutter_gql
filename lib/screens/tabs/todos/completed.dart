import 'package:flutter/material.dart';

import '/components/add_task.dart';
import '/components/todo_item_tile.dart';
import '/data/todo_list.dart';

class Completed extends StatefulWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTask(
          onAdd: (value) {
            todoList.addTodo(value);
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: todoList.completeList.length,
            itemBuilder: (context, index) {
              return TodoItemTile(
                item: todoList.completeList[index],
                delete: () {
                  setState(() {
                    todoList.removeTodo(todoList.completeList[index].id);
                  });
                },
                toggleIsCompleted: () {
                  setState(() {
                    todoList.toggleList(todoList.completeList[index].id);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
