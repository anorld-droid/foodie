import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class CuisineModel {
  final String header;

  CuisineModel({
    required this.header,
  });

  Map<String, dynamic> toFirestore() => {
        Constants.header: header,
      };

  factory CuisineModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>>? snap,
    Map<String, dynamic>? json,
    SnapshotOptions? options,
  ) {
    var snapshot = json ?? snap?.data();
    return CuisineModel(
      header: snapshot?[Constants.header] as String,
    );
  }
}
