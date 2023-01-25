import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.01.2023.
class ShippingUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  /// Append the file to the specified path
  /// NOTE: doc should be user id
  Future<void> upload({
    required String userId,
    required ShippingModel shippingModel,
  }) async {
    await _cloudNetWorkDataSource.appendDoc<ShippingModel>(
        collectionName: Constants.orders,
        docPath: userId,
        collectionPath: Constants.items,
        file: shippingModel,
        fromFirestore: ShippingModel.fromFirestore,
        toFirestore: (ShippingModel shippingModel, _) =>
            shippingModel.toFirestore());
  }

  /// Get the file to the specified path
  Future<Stream<QuerySnapshot<ShippingModel>>> get(String userId) async {
    return await _cloudNetWorkDataSource.getDocs(
        collectionName: Constants.orders,
        docPath: userId,
        collectionPath: Constants.items,
        fromFirestore: ShippingModel.fromFirestore,
        toFirestore: (ShippingModel shippingModel, _) =>
            shippingModel.toFirestore());
  }
}
