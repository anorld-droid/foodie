import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/delivery.dart';

import 'delivery_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Delivery>()])
void main() {
  final kMap = {
    Constants.geoPosition: const GeoPoint(12.34343, 1.878374),
    Constants.historicalData: {
      1234.78: [12.87, 132.21]
    },
    Constants.prepTime: 12,
    Constants.speed: 23.65,
  };

  late Delivery delivery;
  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  //set up
  setUpAll(() async {
    await instance.collection('delivery').doc('testDelivery').set(kMap);
    snapshot = await instance.collection('delivery').doc('testDelivery').get();
  });

  setUp(() {
    delivery = MockDelivery();
  });

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(delivery.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = delivery.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(delivery.toFirestore()).called(1);
      verifyNoMoreInteractions(delivery);
    });

    test('should return [Delivery] with the right data', () {
      //Arrange
      //Act
      final actual = Delivery.fromFirestore(snapshot, null);

      //Assert
      expect(actual, isA<Delivery>());
    });
  });
}
