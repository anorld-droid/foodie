import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 09.02.2023.
class Subscription {
  final String shippingInfo;
  final bool shippingStatus;

  Subscription({required this.shippingInfo, required this.shippingStatus});
  Map<String, dynamic> toFirestore() => {
        Constants.shippingInfo: shippingInfo,
        Constants.shippingStatus: shippingStatus,
      };

  factory Subscription.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    return Subscription(
      shippingInfo: snapshot?[Constants.shippingInfo] as String,
      shippingStatus: snapshot?[Constants.shippingStatus] as bool,
    );
  }
}
