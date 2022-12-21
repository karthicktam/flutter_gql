import 'package:flutter/material.dart';

import '/components/add_task.dart';
import '/components/todo_item_tile.dart';
import '/data/todo_list.dart';

class Active extends StatefulWidget {
  const Active({Key? key}) : super(key: key);

  @override
  _ActiveState createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
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
            itemCount: todoList.activeList.length,
            itemBuilder: (context, index) {
              return TodoItemTile(
                item: todoList.activeList[index],
                delete: () {
                  setState(() {
                    todoList.removeTodo(todoList.activeList[index].id);
                  });
                },
                toggleIsCompleted: () {
                  setState(() {
                    todoList.toggleList(todoList.activeList[index].id);
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
