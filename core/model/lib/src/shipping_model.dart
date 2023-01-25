import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class ShippingModel {
  final String uid;
  final int orderNo;
  final List<CartItem> items;
  final String status;

  ShippingModel({
    required this.uid,
    required this.items,
    required this.orderNo,
    required this.status,
  });
  Map<String, dynamic> toFirestore() => {
        Constants.shippingModel: {
          Constants.uid: uid,
          Constants.orderNo: orderNo,
          Constants.items: items.map((e) => e.toFirestore()).toList(),
          Constants.status: status
        }
      };

  factory ShippingModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    List<dynamic> items = snapshot?[Constants.items] as List<dynamic>;
    return ShippingModel(
      uid: snapshot?[Constants.uid] as String,
      items: items.map((e) {
        e as Map<String, dynamic>;
        return CartItem.fromJson(e);
      }) as List<CartItem>,
      orderNo: snapshot?[Constants.orderNo] as int,
      status: snapshot?[Constants.status] as String,
    );
  }
}

class ShippingInfo {
  final String? name;
  final String? phoneNumber;
  final DestinationModel? destination;

  ShippingInfo({
    required this.name,
    required this.phoneNumber,
    required this.destination,
  });

  Map<String, dynamic> toFirestore() => {
        Constants.shippingInfo: {
          Constants.name: name,
          Constants.phoneNumber: phoneNumber,
          Constants.destination: destination?.toFirestore()
        }
      };

  factory ShippingInfo.fromFirestore(
    Map<String, dynamic>? snapshot,
    SnapshotOptions? options,
  ) {
    DestinationModel? destinationModel =
        snapshot?[Constants.destination] != null
            ? DestinationModel.fromFirestore(
                snapshot?[Constants.destination] as Map<String, dynamic>, null)
            : null;
    return ShippingInfo(
      name: snapshot?[Constants.name] as String?,
      phoneNumber: snapshot?[Constants.phoneNumber] as String?,
      destination: destinationModel,
    );
  }
}
