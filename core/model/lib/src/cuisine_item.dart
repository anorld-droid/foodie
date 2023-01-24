import 'package:get/get.dart';
import 'package:model/model.dart';

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
      photoUrl: photoUrl,
      name: name,
      stockTag: stockTag,
      basicPrice: price,
      sellingPrice: Rx(price),
      quantity: Rx(quantity),
    );
  }
}
