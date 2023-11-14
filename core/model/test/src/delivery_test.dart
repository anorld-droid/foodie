import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/delivery.dart';

@GenerateNiceMocks([MockSpec<Delivery>()])
void main() {
  late Delivery courier;

  //set up
  setUp(() {
    courier = MockDelivery();
  });
  final kMap = {
    Constants.geoPosition: const GeoPoint(12.34343, 1.878374),
    Constants.historicalData: <double, List<double>>{},
    Constants.prepTime: 12,
    Constants.speed: 23.65,
  };

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(courier.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = courier.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(courier.toFirestore()).called(1);
      verifyNoMoreInteractions(courier);
    });

    test('should return [Delivery] with the right data', () {
      //Arrange
      final kMap = {
        Constants.header: 'header',
      };

      //Act
      final actual = Delivery.fromFirestore(null, kMap, null);

      //Assert
      expect(actual, isA<Delivery>());
    });
  });
}
