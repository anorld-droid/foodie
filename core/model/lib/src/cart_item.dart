import 'package:model/src/trice_enums.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class CartItem {
  final String photoUrl;
  final String name;
  final StockTags stockTag;
  final double price;
  final int quantity;

  CartItem(
      {required this.photoUrl,
      required this.name,
      required this.stockTag,
      required this.price,
      required this.quantity});
}
