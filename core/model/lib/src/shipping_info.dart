import 'package:model/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 15.04.2023.
class ShippingInfo {
  final String? name;
  final String? phoneNumber;
  final String? location;

  ShippingInfo({
    required this.name,
    required this.phoneNumber,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
        Constants.shippingInfo: {
          Constants.name: name,
          Constants.phoneNumber: phoneNumber,
          Constants.location: location
        }
      };

  factory ShippingInfo.fromJson(
    Map<String, dynamic>? snapshot,
  ) {
    return ShippingInfo(
      name: snapshot?[Constants.name] as String,
      phoneNumber: snapshot?[Constants.phoneNumber] as String,
      location: snapshot?[Constants.location] as String,
    );
  }
}
