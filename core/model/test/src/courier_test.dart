import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

import 'courier_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Courier>()])
void main() {
  late Courier courier;

  //set up
  setUp(() {
    courier = MockCourier();
  });
  const kJSON = {'key': 'value'};

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(courier.toJson()).thenAnswer((_) => kJSON);

      //Act
      final actual = courier.toJson();

      //Assert
      expect(actual, equals(kJSON));
      verify(courier.toJson()).called(1);
      verifyNoMoreInteractions(courier);
    });

    test('should return [Courier] with the right data', () {
      //Arrange
      final kMap = {
        Constants.uid: 'uid',
        Constants.name: 'name',
        Constants.phoneNumber: 'phoneNumber',
        Constants.photoUrl: 'photoUrl',
      };
      final kCourier = Courier.fromJson(kMap, null);
      // when(Courier.fromJson(kMap, null))
      //     .thenAnswer((realInvocation) => kCourier);

      //Act
      final actual = Courier.fromJson(kMap, null);

      //Assert
      expect(actual.name, equals(kCourier.name));
    });
  });
}
