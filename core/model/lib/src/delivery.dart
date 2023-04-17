import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Delivery {
  final double lat;
  final double long;

  Delivery({required this.lat, required this.long});

  Map<String, dynamic> toFirestore() => {
        Constants.lat: lat,
        Constants.long: long,
      };

  factory Delivery.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    return Delivery(
      lat: snapshot?[Constants.lat] as double,
      long: snapshot?[Constants.long] as double,
    );
  }
}
