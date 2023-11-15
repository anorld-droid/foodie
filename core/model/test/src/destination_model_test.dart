import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

import 'destination_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DestinationModel>()])
void main() {
  final kMap = {
    Constants.county: 'county',
    Constants.town: 'town',
    Constants.building: 'building',
    Constants.floorNo: 'floorNo',
    Constants.roomNo: 'roomNo',
    Constants.area: 'area',
  };

  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  late DestinationModel item;

  //set up
  setUpAll(() async {
    await instance
        .collection('destination')
        .doc('testDestinationModel')
        .set(kMap);
    snapshot = await instance
        .collection('destination')
        .doc('testDestinationModel')
        .get();
  });

  setUp(() {
    item = MockDestinationModel();
  });

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(item.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = item.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(item.toFirestore()).called(1);
      verifyNoMoreInteractions(item);
    });

    test(
        'should take [Map] then, return [DestinationModel] with the right data',
        () {
      //Arrange
      //Act
      final actual = DestinationModel.fromFirestore(kMap, null);

      //Assert
      expect(actual, isA<DestinationModel>());
    });

    test('should acceept [DocumantSnapshot] then, return [DestinationModel]',
        () {
      //Arrange

      //Act
      final actual =
          DestinationModel.fromDocumetSnapshotFirestore(snapshot, null);

      //Assert
      expect(actual, isA<DestinationModel>());
    });
  });
}
