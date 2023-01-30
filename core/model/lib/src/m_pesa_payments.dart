// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 30.01.2023.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

class MpesaResultPayment {
  final String merchantRequestID;
  final String checkoutRequestID;
  final String responseCode;
  final String responseDescription;
  final String customerMessage;

  MpesaResultPayment({
    required this.merchantRequestID,
    required this.checkoutRequestID,
    required this.responseCode,
    required this.responseDescription,
    required this.customerMessage,
  });
  Map<String, dynamic> toFirestore() => {
        Constants.merchantRequestID: merchantRequestID,
        Constants.checkoutRequestID: checkoutRequestID,
        Constants.responseCode: responseCode,
        Constants.responseDescription: responseDescription,
        Constants.customerMessage: customerMessage,
      };

  factory MpesaResultPayment.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    return MpesaResultPayment(
      merchantRequestID: snapshot?[Constants.merchantRequestID] as String,
      checkoutRequestID: snapshot?[Constants.checkoutRequestID] as String,
      responseCode: snapshot?[Constants.responseCode] as String,
      responseDescription: snapshot?[Constants.responseDescription] as String,
      customerMessage: snapshot?[Constants.customerMessage] as String,
    );
  }
}
