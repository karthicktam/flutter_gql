import 'package:flutter/material.dart';

import '/screens/tabs/todos/active.dart';
import '/screens/tabs/todos/all.dart';
import '/screens/tabs/todos/completed.dart';

class Todos extends StatefulWidget {
  Todos({Key? key}) : super(key: key);

  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Active",
              ),
              Tab(
                text: "Completed",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            All(),
            Active(),
            Completed(),
          ],
        ),
      ),
    );
  }
}
