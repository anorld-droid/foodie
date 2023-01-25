import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class CuisineModel {
  final String header;
  final List<CuisineItem> cuisineItems;

  CuisineModel({required this.header, required this.cuisineItems});

  Map<String, dynamic> toFirestore() => {
        Constants.header: header,
        Constants.cuisineItems: cuisineItems
            .map(
              (e) => e.toJson(),
            )
            .toList(),
      };

  factory CuisineModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    List<dynamic> items = snapshot?[Constants.cuisineItems] as List<dynamic>;
    return CuisineModel(
        header: snapshot?[Constants.header] as String,
        cuisineItems: items.map((e) {
          e as Map<String, dynamic>;
          return CuisineItem.fromJson(e);
        }).toList());
  }
}
