import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Delivery {
  final double lat;
  final double long;
  final Map<double, List<double>> historicalData;
  final int preparationTime;
  final double speed;

  Delivery(
      {required this.historicalData,
      required this.preparationTime,
      required this.speed,
      required this.lat,
      required this.long});

  Map<String, dynamic> toFirestore() => {
        Constants.lat: lat,
        Constants.long: long,
        Constants.historicalData: historicalData,
        Constants.prepTime: preparationTime,
        Constants.speed: speed,
      };

  factory Delivery.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    var histData = snapshot?[Constants.historicalData] as Map<double, dynamic>;
    return Delivery(
      lat: snapshot?[Constants.lat] as double,
      long: snapshot?[Constants.long] as double,
      historicalData: histData.map((key, value) {
        value as List<dynamic>;
        return MapEntry(
          key,
          value
              .map(
                (e) => e as double,
              )
              .toList(),
        );
      }),
      preparationTime: snapshot?[Constants.prepTime] as int,
      speed: snapshot?[Constants.speed] as double,
    );
  }
}
