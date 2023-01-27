// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 26.01.2023.
import 'package:network/network.dart';

class SearchNetworkDataSource {
  final Search _search = Search();

  Future<List<dynamic>> invoke(String query) async {
    return _search.invoke(query);
  }
}
