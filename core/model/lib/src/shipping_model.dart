import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class ShippingModel {
  final String phoneNumber;
  final int orderNo;
  final List<CartItem> items;
  final ShippingStatus status;
  final DestinationModel destination;

  ShippingModel({
    required this.phoneNumber,
    required this.items,
    required this.orderNo,
    required this.status,
    required this.destination,
  });
}
