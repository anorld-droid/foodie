import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class CartItemsUseCase {
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();
  final AuthenticateUser _authenticateUser = Get.find();

  String addToCart(CuisineItem cuisineItem, Widget authDialog) {
    if (_authenticateUser.isUserSignedIn()) {
      upload(
        docPath: _authenticateUser.getUserId()!,
        cartItem: cuisineItem.asCartItem(),
      );
      return 'Added to cart';
    } else {
      showAuthDialog(Get.context!, authDialog);
      return 'Try again';
    }
  }

  Future<void> showAuthDialog(BuildContext context, Widget authDialog) async {
    showDialog<Widget>(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Get.theme.backgroundColor,
        builder: (BuildContext buildContext) {
          return authDialog;
        });
  }

  /// Append the file to the specified path
  /// NOTE: doc should be user id
  Future<void> upload({
    required String docPath,
    required CartItem cartItem,
  }) async {
    await _cloudNetWorkDataSource.appendDoc<CartItem>(
        collectionName: Constants.cuisine,
        docPath: Constants.cartItems,
        collectionPath: docPath,
        file: cartItem,
        fromFirestore: CartItem.fromFirestore,
        toFirestore: (CartItem cartItem, _) => cartItem.toFirestore());
  }

  /// Get the file to the specified path
  Future<Stream<QuerySnapshot<CartItem>>> get(String userId) async {
    return await _cloudNetWorkDataSource.getDocs(
        collectionName: Constants.cuisine,
        docPath: Constants.cartItems,
        collectionPath: userId,
        fromFirestore: CartItem.fromFirestore,
        toFirestore: (CartItem cartItem, _) => cartItem.toFirestore());
  }

  /// delete the file from the specified path
  Future<void> delete<CartItem>({
    required String userId,
    required String docId,
  }) async {
    await _cloudNetWorkDataSource.deleteDocFromMulitiCollection<CartItem>(
      collectionName: Constants.cuisine,
      docPath: Constants.cartItems,
      collectionPath: userId,
      docId: docId,
    );
  }
}
