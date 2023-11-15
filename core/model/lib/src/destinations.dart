import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/src/constants.dart';

class Destinations {
  final Map<String, List<Map<String, List<String>>>> destinations;

  const Destinations({required this.destinations});

  Map<String, dynamic> toFirestore() => {
        Constants.destination: destinations,
      };

  factory Destinations.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snap,
    SnapshotOptions? options,
  ) {
    var snapshot = snap.data();
    var destinations = snapshot?[Constants.destination] as Map<String, dynamic>;
    return Destinations(
      destinations: destinations.map((key, value) {
        value as List;
        return MapEntry(
            key,
            value.map((e) {
              e as Map<String, dynamic>;
              return e.map((town, area) {
                area as List;
                return MapEntry(
                    town,
                    area
                        .map(
                          (a) => a as String,
                        )
                        .toList());
              });
            }).toList());
      }),
    );
  }
}
