import 'package:flutter/material.dart';
import 'package:flutter_gql/data/todo_fetch.dart';
import 'package:flutter_gql/model/todo_item.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '/components/add_task.dart';
import '/components/todo_item_tile.dart';
import '/data/todo_list.dart';

class All extends StatefulWidget {
  All({Key? key}) : super(key: key);

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("All tab");
    return Column(
      children: <Widget>[
        AddTask(
          onAdd: (value) {
            todoList.addTodo(value);
          },
        ),
        Expanded(
          child: Query(
              options: QueryOptions(
                  document: gql(TodoFetch.fetchAll),
                  variables: {"is_public": false}),
              builder: (QueryResult result,
                  {VoidCallback? refetch, FetchMore? fetchMore}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }
                if (result.isLoading) {
                  return Text('Loading!');
                }
                List? todos = (result.data?['todos'] as List<dynamic>);
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoItemTile(
                      item: TodoItem.fromElements(
                        todos[index]["id"],
                        todos[index]["task"],
                        todos[index]["isCompleted"],
                      ),
                      delete: () {
                        // setState(() {
                        //   todoList.removeTodo(todos[index].id);
                        // });
                      },
                      toggleIsCompleted: () {
                        // setState(() {
                        //   todoList.toggleList(todos[index].id);
                        // });
                      },
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
