import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class DestinationModel {
  final String town;
  final String area;
  final String? building;
  final String? floorNo;
  final String? roomNo;
  final String? landmark;

  const DestinationModel({
    this.building,
    this.floorNo,
    this.roomNo,
    this.landmark,
    required this.town,
    required this.area,
  });

  Map<String, dynamic> toFirestore() => {
        Constants.town: town,
        Constants.area: area,
        Constants.building: building,
        Constants.floorNo: floorNo,
        Constants.roomNo: roomNo,
        Constants.landmark: landmark,
      };

  factory DestinationModel.fromFirestore(
    Map<String, dynamic> snapshot,
    SnapshotOptions? options,
  ) {
    return DestinationModel(
      town: snapshot[Constants.town] as String,
      area: snapshot[Constants.area] as String,
      building: snapshot[Constants.building] as String,
      floorNo: snapshot[Constants.floorNo] as String,
      roomNo: snapshot[Constants.roomNo] as String,
      landmark: snapshot[Constants.landmark] as String,
    );
  }
}

class Destinations {
  final List<DestinationModel> destinations;

  const Destinations({required this.destinations});
}
