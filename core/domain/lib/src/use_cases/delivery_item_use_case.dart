import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/src/constants.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 15.04.2023.
class DeliveryUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  /// Get the file to the specified path
  Future<Stream<DocumentSnapshot<Delivery>>> get(String courierId) async {
    return _cloudNetWorkDataSource.getDocStream(
        collection: Constants.deliveries,
        doc: courierId,
        fromFirestore: Delivery.fromFirestore,
        toFirestore: (Delivery delivery, _) => delivery.toFirestore());
  }
}
