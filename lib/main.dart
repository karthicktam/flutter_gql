import 'package:flutter/material.dart';

import 'screens/dashboard.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = <String, WidgetBuilder>{
      "/login": (BuildContext context) => Login(),
      "/dashboard": (BuildContext context) => Dashboard(),
      "/signup": (BuildContext context) => Signup(),
    };
    return MaterialApp(
      title: 'Hasura GraphQL Demo',
      theme: ThemeData(primaryColor: Colors.black),
      routes: routes,
      home: Splash(),
    );
  }
}
