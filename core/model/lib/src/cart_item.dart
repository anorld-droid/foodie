import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class CartItem {
  String? id;
  final String photoUrl;
  final String name;
  final int stockTag;
  final String store;
  final double basicPrice;
  final Rx<double> sellingPrice;
  final Rx<int> quantity;
  final int limit;

  CartItem({
    required this.id,
    required this.photoUrl,
    required this.name,
    required this.store,
    required this.stockTag,
    required this.basicPrice,
    required this.sellingPrice,
    required this.quantity,
    required this.limit,
  });

  Map<String, dynamic> toFirestore() => {
        Constants.id: id,
        Constants.name: name,
        Constants.photoUrl: photoUrl,
        Constants.store: store,
        Constants.stockTag: stockTag,
        Constants.basicPrice: basicPrice,
        Constants.sellingPrice: sellingPrice.value,
        Constants.quantity: quantity.value,
        Constants.limit: limit,
      };

  factory CartItem.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>>? snap,
    Map<String, dynamic>? json,
    SnapshotOptions? options,
  ) {
    var snapshot = json ?? snap?.data();
    return CartItem(
      id: snapshot?[Constants.id] as String?,
      photoUrl: snapshot?[Constants.photoUrl] as String,
      name: snapshot?[Constants.name] as String,
      store: snapshot?[Constants.store] as String,
      stockTag: snapshot?[Constants.stockTag] as int,
      basicPrice: snapshot?[Constants.basicPrice] as double,
      sellingPrice: Rx(snapshot?[Constants.sellingPrice] as double),
      quantity: Rx(snapshot?[Constants.quantity] as int),
      limit: snapshot?[Constants.limit] as int,
    );
  }
  factory CartItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return CartItem(
      id: json[Constants.id] as String?,
      photoUrl: json[Constants.photoUrl] as String,
      name: json[Constants.name] as String,
      store: json[Constants.store] as String,
      stockTag: json[Constants.stockTag] as int,
      basicPrice: json[Constants.basicPrice] as double,
      sellingPrice: Rx(json[Constants.sellingPrice] as double),
      quantity: Rx(json[Constants.quantity] as int),
      limit: json[Constants.limit] as int,
    );
  }
}
