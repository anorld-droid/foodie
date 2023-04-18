import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 18.04.2023.
class GoogleMapServices {
  final String key;
  final MapServices _mapServices;
  GoogleMapServices({required this.key}) : _mapServices = MapServices(key: key);

  Future<Map<String, dynamic>> calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) async {
    return _mapServices.distanceWithLocation(
      startLatitude: startLatitude,
      startLongitude: startLongitude,
      endLatitude: endLatitude,
      endLongitude: endLongitude,
    );
  }
}
