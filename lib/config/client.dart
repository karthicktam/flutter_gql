import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../services/shared_preferences_service.dart';

class Config {
  static final HttpLink httpLink =
      HttpLink(Uri.parse("https://hasura.io/learn/graphql").toString());

  static String _token = '';
  static final AuthLink authLink = AuthLink(getToken: () => _token);

  static final WebSocketLink webSocketLink = WebSocketLink(
    Uri.parse('wss://hasura.io/learn/graphql').toString(),
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initialPayload: () async {
        return {
          'headers': {'Authorization', _token}
        };
      },
    ),
  );

  static final Link link = authLink.concat(httpLink).concat(webSocketLink);

  static String token = '';
  static ValueNotifier<GraphQLClient> initializeClient(String token) {
    _token = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: link,
      ),
    );
    return client;
  }
}
