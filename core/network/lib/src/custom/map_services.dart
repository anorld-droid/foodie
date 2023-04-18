import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 18.04.2023.
class MapServices {
  final String key;

  MapServices({required this.key});

  Future<Map<String, dynamic>> distanceWithLocation({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) async {
    final response = await http.get(
      Uri.parse(
        'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$endLatitude,$endLongitude&origins=$startLatitude,$startLongitude&mode=bicycling&key=$key',
      ),
    );
    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    print(distance(startLatitude, startLongitude, endLatitude, endLongitude));
    return jsonResponse;
  }

  double distance(double lat1, double lon1, double lat2, double lon2) {
    const r = 6372.8; // Earth radius in kilometers

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final lat1Radians = _toRadians(lat1);
    final lat2Radians = _toRadians(lat2);

    final a =
        _haversin(dLat) + cos(lat1Radians) * cos(lat2Radians) * _haversin(dLon);
    final c = 2 * asin(sqrt(a));

    return r * c;
  }

  double _toRadians(double degrees) => degrees * pi / 180;

  num _haversin(double radians) => pow(sin(radians / 2), 2);
}
