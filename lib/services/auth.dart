import 'dart:convert';
import 'package:http/http.dart' as http;

class HasuraAuth {
  Future<String> login(String username, String password) async {
    String _token;
    Map credentials = {
      "username": username,
      "password": password,
    };
    http.Response response = await http
        .post(
      Uri.https("hasura.io", "learn/auth/login"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(credentials),
    )
        .catchError((onError) {
      return null;
    });
    _token = jsonDecode(response.body)["token"];
    return _token;
  }

  Future<bool> signup(String username, String password) async {
    bool success = false;
    Map credentials = {
      "username": username,
      "password": password,
    };
    http.Response response = await http
        .post(
      Uri.https("hasura.io", "learn/auth/signup"),
      headers: {"content-type": "application/json"},
      body: jsonEncode(credentials),
    )
        .catchError((onError) {
      return null;
    });
    if (response == null) {
      return success;
    }
    print('res ${response.body}');
    success = jsonDecode(response.body)["id"] != null;
    return success;
  }
}

HasuraAuth hasuraAuth = new HasuraAuth();
