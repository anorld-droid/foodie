import 'package:network/src/constants.dart';
import 'package:typesense/typesense.dart';

// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 26.01.2023.
class Search {
  Client _auth() {
    final host = Constants.typesenseHost;
    final config = Configuration(
      Constants.searchKey,
      nodes: {
        Node(
          Protocol.https,
          host,
          port: 443,
        ),
      },
      connectionTimeout: const Duration(seconds: 2),
    );
    return Client(config);
  }

  Future<List<dynamic>> invoke(String query) async {
    final searchParameters = {'q': query, 'query_by': 'header'};
    final Client client = _auth();
    var json = await client
        .collection(Constants.cuisineHomeCollection)
        .documents
        .search(searchParameters);
    return json['hits'] as List<dynamic>;
  }
}
