import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 10.04.2023.

class Restaurant {
  final String name;
  final String locationName;
  final String locationCoordinate;

  Restaurant(
      {required this.name,
      required this.locationName,
      required this.locationCoordinate});

  Map<String, dynamic> toFirestore() => {
        Constants.name: name,
        Constants.locationName: locationName,
        Constants.locationCoordinate: locationCoordinate
      };

  factory Restaurant.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    return Restaurant(
      name: snapshot?[Constants.name] as String,
      locationName: snapshot?[Constants.locationName] as String,
      locationCoordinate: snapshot?[Constants.locationCoordinate] as String,
    );
  }
}
