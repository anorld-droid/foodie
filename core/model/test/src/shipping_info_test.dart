import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/shipping_info.dart';

@GenerateNiceMocks([MockSpec<ShippingInfo>()])
void main() {
  late ShippingInfo shippingInfo;

  //set up
  setUp(() {
    shippingInfo = MockShippingInfo();
  });

  final kMap = {
    Constants.name: 'name',
    Constants.locationName: 'locationName',
    Constants.locationCoordinate: 'locationCoordinate'
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
