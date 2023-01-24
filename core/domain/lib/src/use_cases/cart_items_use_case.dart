import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class CartItemsUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  /// Append the file to the specified path
  /// NOTE: doc should be user id
  Future<void> upload({
    required String docPath,
    required CartItem cartItem,
  }) async {
    await _cloudNetWorkDataSource.appendDoc<CartItem>(
        collectionName: Constants.cartItems,
        docPath: docPath,
        collectionPath: Constants.items,
        file: cartItem,
        fromFirestore: CartItem.fromFirestore,
        toFirestore: (CartItem cartItem, _) => cartItem.toFirestore());
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<Stream<QuerySnapshot<CartItem>>> get(String userId) async {
    return await _cloudNetWorkDataSource.getDocs(
        collectionName: Constants.cartItems,
        docPath: userId,
        collectionPath: Constants.items,
        fromFirestore: CartItem.fromFirestore,
        toFirestore: (CartItem cartItem, _) => cartItem.toFirestore());
  }
}
