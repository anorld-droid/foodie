import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.

class CuisineItem {
  final String name;
  final int stockTag;
  final String store;
  final double basicPrice;
  final Rx<double> sellingPrice;
  final Rx<int> quantity;
  final String detail;
  final String nutrients;
  final String photoUrl;
  final List<String> favorites;

  CuisineItem(
      {required this.name,
      required this.store,
      required this.stockTag,
      required this.basicPrice,
      required this.sellingPrice,
      required this.quantity,
      required this.detail,
      required this.nutrients,
      required this.photoUrl,
      required this.favorites});

  CartItem asCartItem() {
    return CartItem(
      id: null,
      photoUrl: photoUrl,
      name: name,
      store: store,
      stockTag: stockTag,
      basicPrice: basicPrice,
      sellingPrice: sellingPrice,
      quantity: quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Constants.name: name,
      Constants.store: store,
      Constants.stockTag: stockTag,
      Constants.basicPrice: basicPrice,
      Constants.sellingPrice: sellingPrice.value,
      Constants.quantity: quantity.value,
      Constants.detail: detail,
      Constants.nutrients: nutrients,
      Constants.photoUrl: photoUrl,
      Constants.favorites: favorites,
    };
  }

  factory CuisineItem.fromJson(
    Map<String, dynamic> json,
  ) {
    var favorites = json[Constants.favorites] as List;
    return CuisineItem(
      name: json[Constants.name] as String,
      store: json[Constants.store] as String,
      stockTag: json[Constants.stockTag] as int,
      basicPrice: json[Constants.basicPrice] as double,
      sellingPrice: Rx(json[Constants.sellingPrice] as double),
      quantity: Rx(json[Constants.quantity] as int),
      detail: json[Constants.detail] as String,
      nutrients: json[Constants.nutrients] as String,
      photoUrl: json[Constants.photoUrl] as String,
      favorites: favorites.map((e) => e as String).toList(),
    );
  }
}
