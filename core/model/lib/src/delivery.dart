import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Delivery {
  final String courierUid;
  final double lat;
  final double long;

  Delivery({required this.courierUid, required this.lat, required this.long});

  Map<String, dynamic> toJson() => {
        Constants.courierUid: courierUid,
        Constants.lat: lat,
        Constants.long: long,
      };

  factory Delivery.fromJson(
    Map<String, dynamic>? snapshot,
    SnapshotOptions? options,
  ) {
    return Delivery(
      courierUid: snapshot?[Constants.courierUid] as String,
      lat: snapshot?[Constants.lat] as double,
      long: snapshot?[Constants.long] as double,
    );
  }
}
