import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 15.04.2023.
class ShippingInfo {
  final String? name;
  final String? phoneNumber;
  final String? location;
  final double lat;
  final double lng;

  ShippingInfo({
    required this.name,
    required this.phoneNumber,
    required this.location,
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toJson() => {
        Constants.shippingInfo: {
          Constants.name: name,
          Constants.phoneNumber: phoneNumber,
          Constants.location: location,
          Constants.geoPosition: GeoPoint(lat, lng)
        }
      };

  factory ShippingInfo.fromJson(
    Map<String, dynamic>? snapshot,
  ) {
    GeoPoint geoPoint = snapshot?[Constants.geoPosition] as GeoPoint;
    return ShippingInfo(
      name: snapshot?[Constants.name] as String,
      phoneNumber: snapshot?[Constants.phoneNumber] as String,
      location: snapshot?[Constants.location] as String,
      lat: geoPoint.latitude,
      lng: geoPoint.longitude,
    );
  }
}
