import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/cuisine_model.dart';

import 'cuisine_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CuisineModel>()])
void main() {
  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  late CuisineModel cuisineModel;

  final kMap = {
    Constants.header: 'header',
  };

  //set up
  setUpAll(() async {
    await instance.collection('cuisineModel').doc('testCuisineModel').set(kMap);
    snapshot =
        await instance.collection('cuisineModel').doc('testCuisineModel').get();
  });

  setUp(() {
    cuisineModel = MockCuisineModel();
  });

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(cuisineModel.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = cuisineModel.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(cuisineModel.toFirestore()).called(1);
      verifyNoMoreInteractions(cuisineModel);
    });

    test('should return [CuisineModel] with the right data', () {
      //Act
      final actual = CuisineModel.fromFirestore(snapshot, null);

      //Assert
      expect(actual, isA<CuisineModel>());
    });
  });
}
