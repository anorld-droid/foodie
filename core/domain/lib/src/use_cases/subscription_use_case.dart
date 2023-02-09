import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 08.02.2023.
class SubscriptionUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  // Get the file to the specified path
  Future<DocumentSnapshot<Subscription>> get() async {
    return await _cloudNetWorkDataSource.getDoc(
      collection: Constants.cuisine,
      doc: Constants.subscription,
      fromFirestore: Subscription.fromFirestore,
      toFirestore: (Subscription subscription, _) => subscription.toFirestore(),
    );
  }
}
