import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 15.04.2023.
class Courier {
  final String uid;
  final String name;
  final String phoneNumber;
  final String photoUrl;

  Courier({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.photoUrl,
  });
  Map<String, dynamic> toJson() => {
        Constants.uid: uid,
        Constants.name: name,
        Constants.phoneNumber: phoneNumber,
        Constants.photoUrl: photoUrl,
      };

  factory Courier.fromJson(
    Map<String, dynamic>? snapshot,
    SnapshotOptions? options,
  ) {
    return Courier(
      uid: snapshot?[Constants.name] as String,
      name: snapshot?[Constants.name] as String,
      phoneNumber: snapshot?[Constants.phoneNumber] as String,
      photoUrl: snapshot?[Constants.photoUrl] as String,
    );
  }
}
