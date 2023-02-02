import 'package:model/model.dart';

import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 14.01.2023.
class User {
  final String uid;
  final String? photoUrl;
  final String username;
  final ShippingInfo? shippingInfo;

  const User({
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.shippingInfo,
  });

  Map<String, dynamic> toFirestore() => {
        Constants.uid: uid,
        Constants.username: username,
        Constants.photoUrl: photoUrl,
        Constants.shippingInfo: shippingInfo?.toFirestore()
      };

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    return User(
      uid: snapshot?[Constants.uid] as String,
      photoUrl: snapshot?[Constants.photoUrl] as String?,
      username: snapshot?[Constants.username] as String,
      shippingInfo: snapshot?[Constants.shippingInfo] != null
          ? ShippingInfo.fromFirestore(
              snapshot?[Constants.shippingInfo] as Map<String, dynamic>,
              options,
            )
          : null,
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json,
    SnapshotOptions? options,
  ) {
    return User(
      uid: json[Constants.uid] as String,
      photoUrl: json[Constants.photoUrl] as String,
      username: json[Constants.username] as String,
      shippingInfo: json[Constants.shippingInfo] != null
          ? ShippingInfo.fromFirestore(
              json[Constants.shippingInfo] as Map<String, dynamic>,
              options,
            )
          : null,
    );
  }
}
