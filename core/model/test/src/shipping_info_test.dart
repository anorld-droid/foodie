import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/shipping_info.dart';

import 'shipping_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ShippingInfo>()])
void main() {
  late ShippingInfo shippingInfo;

  //set up
  setUp(() {
    shippingInfo = MockShippingInfo();
  });

  final kMap = {
    Constants.name: 'name',
    Constants.phoneNumber: 'phoneNumber',
    Constants.location: 'location',
    Constants.geoPosition: const GeoPoint(12.565434, 1.232323)
  };
  final kShippingInfo = ShippingInfo.fromJson(kMap);

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(shippingInfo.toJson()).thenAnswer((_) => kMap);

      //Act
      final actual = shippingInfo.toJson();

      //Assert
      expect(actual, equals(kMap));
      verify(shippingInfo.toJson()).called(1);
      verifyNoMoreInteractions(shippingInfo);
    });

    test('should return [ShippingInfo] with the right data', () {
      //Arrange

      //Act
      final actual = ShippingInfo.fromJson(kMap);

      //Assert
      expect(actual, isA<ShippingInfo>());
      expect(actual.name, equals(kShippingInfo.name));
    });
  });
}
