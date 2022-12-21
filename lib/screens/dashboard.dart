import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '/config/client.dart';
import './tabs/dashboard/feeds.dart';
import './tabs/dashboard/online.dart';
import './tabs/dashboard/todos.dart';
import '../services/shared_preferences_service.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: sharedPreferenceService.token as Future<String>,
      builder: (BuildContext ctx, AsyncSnapshot<String> snapshot) {
        Widget children = const Text('Something went wrong!');
        if (snapshot.hasError) {
          children = Text(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          children = GraphQLProvider(
            client: Config.initializeClient(snapshot.data!),
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: const Text(
                    "ToDo App",
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      onPressed: () async {
                        sharedPreferenceService.clearToken();
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                    ),
                  ],
                ),
                bottomNavigationBar: const TabBar(
                  tabs: [
                    Tab(
                      text: "Todos",
                      icon: Icon(Icons.edit),
                    ),
                    Tab(
                      text: "Feeds",
                      icon: Icon(Icons.message),
                    ),
                    Tab(
                      text: "Online",
                      icon: Icon(Icons.people),
                    ),
                  ],
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(5.0),
                  indicatorColor: Colors.blue,
                ),
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Todos(),
                    const Feeds(),
                    const Online(),
                  ],
                ),
              ),
            ),
          );
        }
        return children;
      },
    );
  }
}
