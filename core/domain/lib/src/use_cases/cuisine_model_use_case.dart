import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class CuisineModelUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();
  final SearchNetworkDataSource _searchNetworkDataSource =
      SearchNetworkDataSource();
  final CloudFunctionsNetworkDataSource _cloudFunctionsNetworkDataSource =
      CloudFunctionsNetworkDataSource();

  /// Get the cuisine home items to the specified path
  Future<List<CuisineModel>> getHeaders() async {
    var items = await _cloudFunctionsNetworkDataSource
        .get('${Constants.cuisine}/${Constants.home}');
    return items.map((e) => CuisineModel(header: e)).toList();
  }

  Future<List<CuisineItem>> search(String query) async {
    var json = await _searchNetworkDataSource.invoke(query);
    List<CuisineItem> items = [];
    // for (var element in json) {
    //   var cuisineItemList = element['document']['cuisineItems'] as List;
    //   for (var item in cuisineItemList) {
    //     item as Map<String, dynamic>;
    //     items.add(CuisineItem.fromJson(item));
    //   }
    // }
    return items;
  }
}
