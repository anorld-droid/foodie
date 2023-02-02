import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 01.02.2023.
class GetDestinationsUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  /// Get the file to the specified path
  /// Get the cuisine home items to the specified path
  Future<Stream<QuerySnapshot<DestinationModel>>> get() async {
    return await _cloudNetWorkDataSource.getDocs(
        collectionName: Constants.cuisine,
        docPath: Constants.destinations,
        collectionPath: Constants.items,
        fromFirestore: DestinationModel.fromDocumetSnapshotFirestore,
        toFirestore: (DestinationModel destinationModel, _) =>
            destinationModel.toFirestore());
  }
}
