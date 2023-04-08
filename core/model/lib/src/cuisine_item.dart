import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.

class CuisineItem {
  final String name;
  final Map<String, int> stockTag;
  final String store;
  final Map<String, double> basicPrice;
  final Rx<Map<String, double>> sellingPrice;
  final Rx<int> quantity;
  final String detail;
  final String photoUrl;
  final List<Map<String, String>> favorites;

  CuisineItem(
      {required this.name,
      required this.store,
      required this.stockTag,
      required this.basicPrice,
      required this.sellingPrice,
      required this.quantity,
      required this.detail,
      required this.photoUrl,
      required this.favorites});

  CartItem asCartItem(String selectedStore) {
    return CartItem(
      id: null,
      photoUrl: photoUrl,
      name: name,
      store: selectedStore,
      stockTag: stockTag[selectedStore] ?? 0,
      basicPrice: basicPrice[selectedStore]!,
      sellingPrice: Rx(sellingPrice.value[selectedStore]!),
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
      Constants.photoUrl: photoUrl,
      Constants.favorites: favorites,
    };
  }

  factory CuisineItem.fromJson(
    Map<String, dynamic> json,
  ) {
    List<dynamic> favorites = json[Constants.favorites] as List<dynamic>;
    var stockTag = json[Constants.stockTag] as Map<String, int>;
    var basicPrice = json[Constants.basicPrice] as Map<String, double>;
    var sellingPrice = json[Constants.sellingPrice] as Map<String, double>;
    return CuisineItem(
      name: json[Constants.name] as String,
      store: json[Constants.store] as String,
      stockTag: stockTag,
      basicPrice: basicPrice,
      sellingPrice: Rx(sellingPrice),
      quantity: Rx(json[Constants.quantity] as int),
      detail: json[Constants.detail] as String,
      photoUrl: json[Constants.photoUrl] as String,
      favorites: favorites.map((e) => e as Map<String, String>).toList(),
    );
  }
}
