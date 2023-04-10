// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 10.04.2023.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class RestaurantItemUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  /// Get the file to the specified path
  /// Get the cuisine home items to the specified path
  Stream<QuerySnapshot<Restaurant>> get(String location) {
    return _cloudNetWorkDataSource.getDocs(
        collectionName: Constants.cuisine,
        docPath: Constants.restaurants,
        collectionPath: location,
        fromFirestore: Restaurant.fromFirestore,
        toFirestore: (Restaurant restaurant, _) => restaurant.toFirestore());
  }
}
