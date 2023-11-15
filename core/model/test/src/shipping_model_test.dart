import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

@GenerateNiceMocks([MockSpec<ShippingModel>()])
void main() {
  final kMap = {
    Constants.id: 'id',
    Constants.user: ShippingInfo(
            lat: 54.2323,
            name: anyNamed('name'),
            phoneNumber: anyNamed('phoneNumber'),
            location: anyNamed('location'),
            lng: 12.3434)
        .toJson(),
    Constants.order: 'order',
    Constants.items: <CartItem>[],
    Constants.courier: Courier(
            uid: 'uid',
            name: 'name',
            phoneNumber: 'phoneNumber',
            photoUrl: 'any')
        .toJson(),
    Constants.status: 'status',
    Constants.timeStamp: Timestamp.fromDate(DateTime.now()),
  };

  late ShippingModel shippingModel;
  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  //set up
  setUpAll(() async {
    await instance
        .collection('shippingModel')
        .doc('testShippingModel')
        .set(kMap);
    snapshot = await instance
        .collection('shippingModel')
        .doc('testShippingModel')
        .get();
  });

  setUp(() {
    shippingModel = MockShippingModel();
  });

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(shippingModel.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = shippingModel.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(shippingModel.toFirestore()).called(1);
      verifyNoMoreInteractions(shippingModel);
    });

    test('should return [ShippingModel] with the right data', () {
      //Arrange

      //Act
      final actual = ShippingModel.fromFirestore(snapshot, null);

      //Assert
      expect(actual, isA<ShippingModel>());
    });
  });
}
