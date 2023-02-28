import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class DestinationModel {
  final String county;
  final String town;
  final String? building;
  final String? floorNo;
  final String? roomNo;
  final String? area;

  const DestinationModel({
    this.building,
    this.floorNo,
    this.roomNo,
    this.area,
    required this.county,
    required this.town,
  });

  Map<String, dynamic> toFirestore() => {
        Constants.county: county,
        Constants.town: town,
        Constants.building: building,
        Constants.floorNo: floorNo,
        Constants.roomNo: roomNo,
        Constants.area: area,
      };

  factory DestinationModel.fromFirestore(
    Map<String, dynamic> snapshot,
    SnapshotOptions? options,
  ) {
    return DestinationModel(
      county: snapshot[Constants.town] as String,
      town: snapshot[Constants.county] as String,
      building: snapshot[Constants.building] as String,
      floorNo: snapshot[Constants.floorNo] as String,
      roomNo: snapshot[Constants.roomNo] as String,
      area: snapshot[Constants.area] as String,
    );
  }

  factory DestinationModel.fromDocumetSnapshotFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    return DestinationModel(
      county: snapshot?[Constants.county] as String,
      town: snapshot?[Constants.town] as String,
      building: snapshot?[Constants.building] as String?,
      floorNo: snapshot?[Constants.floorNo] as String?,
      roomNo: snapshot?[Constants.roomNo] as String?,
      area: snapshot?[Constants.area] as String?,
    );
  }
}

class Destinations {
  final Map<String, List<Map<String, List<String>>>> destinations;

  const Destinations({required this.destinations});

  Map<String, dynamic> toFirestore() => {
        Constants.destination: destinations,
      };

  factory Destinations.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    var destinations = snapshot?[Constants.destination] as Map<String, dynamic>;
    return Destinations(
      destinations: destinations.map((key, value) {
        value as List;
        return MapEntry(
            key,
            value.map((e) {
              e as Map<String, dynamic>;
              return e.map((town, area) {
                area as List;
                return MapEntry(
                    town,
                    area
                        .map(
                          (a) => a as String,
                        )
                        .toList());
              });
            }).toList());
      }),
    );
  }
}
