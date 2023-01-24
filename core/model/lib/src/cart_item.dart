import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class CartItem {
  final String photoUrl;
  final String name;
  final String stockTag;
  final double basicPrice;
  final Rx<double> sellingPrice;
  final Rx<int> quantity;

  CartItem(
      {required this.photoUrl,
      required this.name,
      required this.stockTag,
      required this.basicPrice,
      required this.sellingPrice,
      required this.quantity});

  Map<String, dynamic> toFirestore() => {
        Constants.name: name,
        Constants.photoUrl: photoUrl,
        Constants.stockTag: stockTag,
        Constants.basicPrice: basicPrice,
        Constants.sellingPrice: sellingPrice.value,
        Constants.quantity: quantity.value,
      };

  factory CartItem.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    return CartItem(
        photoUrl: snapshot?[Constants.photoUrl] as String,
        name: snapshot?[Constants.name] as String,
        stockTag: snapshot?[Constants.stockTag] as String,
        basicPrice: snapshot?[Constants.basicPrice] as double,
        sellingPrice: Rx(snapshot?[Constants.sellingPrice] as double),
        quantity: Rx(snapshot?[Constants.quantity] as int));
  }
}
