import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class CuisineModelUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  /// Get the cuisine home items to the specified path
  Future<Stream<QuerySnapshot<CuisineModel>>> get(String userId) async {
    return await _cloudNetWorkDataSource.getDocs(
        collectionName: Constants.cuisine,
        docPath: Constants.home,
        collectionPath: Constants.items,
        fromFirestore: CuisineModel.fromFirestore,
        toFirestore: (CuisineModel cuisineModel, _) =>
            cuisineModel.toFirestore());
  }
}
