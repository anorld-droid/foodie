import 'package:model/src/trice_enums.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.

class CuisineItem {
  final String name;
  final StockTags stockTag;
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
}
