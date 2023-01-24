import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class ShippingModel {
  final String uid;
  final int orderNo;
  final List<CartItem> items;
  final ShippingStatus status;

  ShippingModel({
    required this.uid,
    required this.items,
    required this.orderNo,
    required this.status,
  });
}

class ShippingInfo {
  final String name;
  final String phoneNumber;
  final DestinationModel destination;

  ShippingInfo({
    required this.name,
    required this.phoneNumber,
    required this.destination,
  });

  Map<String, dynamic> toFirestore() => {
        Constants.shippingInfo: {
          Constants.name: name,
          Constants.phoneNumber: phoneNumber,
          Constants.destination: destination.toFirestore()
        }
      };

  factory ShippingInfo.fromFirestore(
    Map<String, dynamic> snapshot,
    SnapshotOptions? options,
  ) {
    DestinationModel destinationModel = DestinationModel.fromFirestore(
        snapshot[Constants.destination] as Map<String, dynamic>, null);
    return ShippingInfo(
      name: snapshot[Constants.name] as String,
      phoneNumber: snapshot[Constants.phoneNumber] as String,
      destination: destinationModel,
    );
  }
}
