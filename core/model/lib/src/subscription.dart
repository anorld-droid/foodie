import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 09.02.2023.
class Subscription {
  final String shippingInfo;
  final bool shippingStatus;
  final int minShipAmount;
  final double executivePrice;
  final double elitePrice;
  final Map<String, String> executiveBenefits;
  final Map<String, String> eliteBenefits;

  Subscription({
    required this.shippingInfo,
    required this.shippingStatus,
    required this.minShipAmount,
    required this.executiveBenefits,
    required this.eliteBenefits,
    required this.executivePrice,
    required this.elitePrice,
  });
  Map<String, dynamic> toFirestore() => {
        Constants.shippingInfo: shippingInfo,
        Constants.shippingStatus: shippingStatus,
        Constants.minShipAmount: minShipAmount,
        Constants.executiveBenefits: executiveBenefits,
        Constants.eliteBenefits: eliteBenefits,
        Constants.executivePrice: executivePrice,
        Constants.elitePrice: elitePrice,
      };

  factory Subscription.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    var executiveBenefits =
        snapshot?[Constants.executiveBenefits] as Map<String, dynamic>;
    var eliteBenefits =
        snapshot?[Constants.eliteBenefits] as Map<String, dynamic>;
    return Subscription(
      shippingInfo: snapshot?[Constants.shippingInfo] as String,
      shippingStatus: snapshot?[Constants.shippingStatus] as bool,
      minShipAmount: snapshot?[Constants.minShipAmount] as int,
      executiveBenefits:
          executiveBenefits.map((key, value) => MapEntry(key, value as String)),
      eliteBenefits:
          eliteBenefits.map((key, value) => MapEntry(key, value as String)),
      executivePrice: snapshot?[Constants.executivePrice] as double,
      elitePrice: snapshot?[Constants.elitePrice] as double,
    );
  }
}
