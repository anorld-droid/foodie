import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/cuisine_model.dart';

@GenerateNiceMocks([MockSpec<CuisineModel>()])
void main() {
  late CuisineModel courier;

  //set up
  setUp(() {
    courier = MockCuisineModel();
  });
  const kJSON = {'key': 'value'};

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(courier.toFirestore()).thenAnswer((_) => kJSON);

      //Act
      final actual = courier.toFirestore();

      //Assert
      expect(actual, equals(kJSON));
      verify(courier.toFirestore()).called(1);
      verifyNoMoreInteractions(courier);
    });

    test('should return [CuisineModel] with the right data', () {
      //Arrange
      final kMap = {
        Constants.header: 'header',
      };

      //Act
      final actual = CuisineModel.fromFirestore(null, kMap, null);

      //Assert
      expect(actual, isA<CuisineModel>());
    });
  });
}
