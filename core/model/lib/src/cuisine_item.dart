import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class CuisineItem {
  String? id;
  final String name;
  final Map<String, int> stockTag;
  final String store;
  final Map<String, double> basicPrice;
  final Rx<Map<String, double>> sellingPrice;
  final Rx<int> quantity;
  final String detail;
  final String photoUrl;
  final Map<String, List<String>> favorites;

  CuisineItem(this.id,
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

  Map<String, dynamic> toFirestore() => {
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

  factory CuisineItem.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    var snap = snapshot.data();
    var favorites = snap?[Constants.favorites] as Map<String, dynamic>;
    var stockTag = snap?[Constants.stockTag] as Map<String, dynamic>;
    var basicPrice = snap?[Constants.basicPrice] as Map<String, dynamic>;
    var sellingPrice = snap?[Constants.sellingPrice] as Map<String, dynamic>;
    return CuisineItem(
      snapshot.id,
      name: snap?[Constants.name] as String,
      store: snap?[Constants.store] as String,
      stockTag: stockTag.map((key, value) => MapEntry(key, value as int)),
      basicPrice:
          basicPrice.map((key, value) => MapEntry(key, value as double)),
      sellingPrice:
          Rx(sellingPrice.map((key, value) => MapEntry(key, value as double))),
      quantity: Rx(snap?[Constants.quantity] as int),
      detail: snap?[Constants.detail] as String,
      photoUrl: snap?[Constants.photoUrl] as String,
      favorites: favorites.map((key, value) {
        value as List<dynamic>;
        return MapEntry(
          key,
          value
              .map(
                (e) => e as String,
              )
              .toList(),
        );
      }),
    );
  }
}
