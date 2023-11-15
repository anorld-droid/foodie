import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Delivery {
  final double lat;
  final double lng;
  final Map<double, List<double>> historicalData;
  final int preparationTime;
  final double speed;

  Delivery(
      {required this.historicalData,
      required this.preparationTime,
      required this.speed,
      required this.lat,
      required this.lng});

  Map<String, dynamic> toFirestore() => {
        Constants.location: GeoPoint(lat, lng),
        Constants.historicalData: historicalData,
        Constants.prepTime: preparationTime,
        Constants.speed: speed,
      };

  factory Delivery.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>>? snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap?.data();
    var histData = snapshot?[Constants.historicalData] as Map<double, dynamic>;
    GeoPoint geoPoint = snapshot?[Constants.geoPosition] as GeoPoint;
    return Delivery(
      lat: geoPoint.latitude,
      lng: geoPoint.longitude,
      historicalData: histData.map((key, value) {
        value as List<dynamic>;
        return MapEntry(
          key,
          value.map((e) {
            String nValue = '$e';
            return double.parse(nValue);
          }).toList(),
        );
      }),
      preparationTime: snapshot?[Constants.prepTime] as int,
      speed: snapshot?[Constants.speed] as double,
    );
  }
}
