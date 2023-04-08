import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class CuisineItemUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  /// Get the file to the specified path
  Stream<QuerySnapshot<CuisineItem>> get(String header) {
    return _cloudNetWorkDataSource.getDocs(
        collectionName: Constants.cuisine,
        docPath: Constants.home,
        collectionPath: header,
        fromFirestore: CuisineItem.fromFirestore,
        toFirestore: (CuisineItem cuisineItem, _) => cuisineItem.toFirestore());
  }
}
