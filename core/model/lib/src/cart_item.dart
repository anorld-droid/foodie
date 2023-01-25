import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class CartItem {
  String? id;
  final String photoUrl;
  final String name;
  final String stockTag;
  final double basicPrice;
  final Rx<double> sellingPrice;
  final Rx<int> quantity;

  CartItem(
      {required this.id,
      required this.photoUrl,
      required this.name,
      required this.stockTag,
      required this.basicPrice,
      required this.sellingPrice,
      required this.quantity});

  Map<String, dynamic> toFirestore() => {
        Constants.id: id,
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
        id: snapshot?[Constants.id] as String?,
        photoUrl: snapshot?[Constants.photoUrl] as String,
        name: snapshot?[Constants.name] as String,
        stockTag: snapshot?[Constants.stockTag] as String,
        basicPrice: snapshot?[Constants.basicPrice] as double,
        sellingPrice: Rx(snapshot?[Constants.sellingPrice] as double),
        quantity: Rx(snapshot?[Constants.quantity] as int));
  }
  factory CartItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return CartItem(
      id: json[Constants.id] as String?,
      photoUrl: json[Constants.photoUrl] as String,
      name: json[Constants.name] as String,
      stockTag: json[Constants.stockTag] as String,
      basicPrice: json[Constants.basicPrice] as double,
      sellingPrice: Rx(json[Constants.sellingPrice] as double),
      quantity: Rx(json[Constants.quantity] as int),
    );
  }
}
