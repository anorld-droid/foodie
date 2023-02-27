import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.

class CuisineItem {
  final String name;
  final String stockTag;
  final double basicPrice;
  final Rx<double> sellingPrice;
  final Rx<int> quantity;
  final String detail;
  final String nutrients;
  final String photoUrl;

  CuisineItem(
      {required this.name,
      required this.stockTag,
      required this.basicPrice,
      required this.sellingPrice,
      required this.quantity,
      required this.detail,
      required this.nutrients,
      required this.photoUrl});

  CartItem asCartItem() {
    return CartItem(
      id: null,
      photoUrl: photoUrl,
      name: name,
      stockTag: stockTag,
      basicPrice: basicPrice,
      sellingPrice: sellingPrice,
      quantity: quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Constants.name: name,
      Constants.stockTag: stockTag,
      Constants.basicPrice: basicPrice,
      Constants.sellingPrice: sellingPrice.value,
      Constants.quantity: quantity.value,
      Constants.detail: detail,
      Constants.nutrients: nutrients,
      Constants.photoUrl: photoUrl,
    };
  }

  factory CuisineItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return CuisineItem(
      name: json[Constants.name] as String,
      stockTag: json[Constants.stockTag] as String,
      basicPrice: json[Constants.basicPrice] as double,
      sellingPrice: Rx(json[Constants.sellingPrice] as double),
      quantity: Rx(json[Constants.quantity] as int),
      detail: json[Constants.detail] as String,
      nutrients: json[Constants.nutrients] as String,
      photoUrl: json[Constants.photoUrl] as String,
    );
  }
}
