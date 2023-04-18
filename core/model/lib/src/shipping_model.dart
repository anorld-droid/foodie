import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class ShippingModel {
  String? id;
  final ShippingInfo user;
  final String order;
  final List<CartItem> items;
  final String status;
  final Courier? courier;
  final DateTime timeStamp;

  ShippingModel({
    required this.user,
    required this.items,
    required this.order,
    required this.status,
    this.courier,
    required this.timeStamp,
    this.id,
  });
  Map<String, dynamic> toFirestore() => {
        Constants.id: id,
        Constants.user: user.toJson(),
        Constants.order: order,
        Constants.items: items.map((e) => e.toFirestore()).toList(),
        Constants.courier: courier?.toJson(),
        Constants.status: status,
        Constants.timeStamp: Timestamp.fromDate(timeStamp),
      };

  factory ShippingModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    List<dynamic> items = snapshot?[Constants.items] as List<dynamic>;
    var courier = snapshot?[Constants.courier];
    var user = snapshot?[Constants.user][Constants.shippingInfo];
    Timestamp stamp = snapshot?[Constants.timeStamp] as Timestamp;
    return ShippingModel(
      id: snapshot?[Constants.id] as String?,
      user: ShippingInfo.fromJson(user as Map<String, dynamic>),
      items: items.map((e) {
        e as Map<String, dynamic>;
        return CartItem.fromJson(e);
      }).toList(),
      order: snapshot?[Constants.order] as String,
      status: snapshot?[Constants.status] as String,
      courier: courier != null
          ? Courier.fromJson(
              courier as Map<String, dynamic>,
              options,
            )
          : null,
      timeStamp: stamp.toDate(),
    );
  }
}
