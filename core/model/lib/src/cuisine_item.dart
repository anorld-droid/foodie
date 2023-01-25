import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.

class CuisineItem {
  final String name;
  final String stockTag;
  final double price;
  final String detail;
  final List<String> nutrients;
  final String photoUrl;

  CuisineItem(
      {required this.name,
      required this.stockTag,
      required this.price,
      required this.detail,
      required this.nutrients,
      required this.photoUrl});

  CartItem asCartItem(int quantity) {
    return CartItem(
      id: null,
      photoUrl: photoUrl,
      name: name,
      stockTag: stockTag,
      basicPrice: price,
      sellingPrice: Rx(price * quantity),
      quantity: Rx(quantity),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Constants.name: name,
      Constants.stockTag: stockTag,
      Constants.price: price,
      Constants.detail: detail,
      Constants.nutrients: nutrients,
      Constants.photoUrl: photoUrl,
    };
  }

  factory CuisineItem.fromJson(
    Map<String, dynamic> json,
  ) {
    var nutrients = json[Constants.nutrients] as List;
    return CuisineItem(
      name: json[Constants.name] as String,
      stockTag: json[Constants.stockTag] as String,
      price: json[Constants.price] as double,
      detail: json[Constants.detail] as String,
      nutrients: nutrients.map((e) => e.toString()).toList(),
      photoUrl: json[Constants.photoUrl] as String,
    );
  }
}
