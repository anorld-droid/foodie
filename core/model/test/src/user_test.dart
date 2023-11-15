import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/shipping_info.dart';
import 'package:model/src/user.dart';

@GenerateNiceMocks([MockSpec<User>()])
void main() {
  final kMap = {
    Constants.uid: 'uid',
    Constants.username: 'username',
    Constants.photoUrl: 'photoUrl',
    Constants.shippingInfo: ShippingInfo(
            lat: 54.2323,
            name: anyNamed('name'),
            phoneNumber: anyNamed('phoneNumber'),
            location: anyNamed('location'),
            lng: 12.3434)
        .toJson(),
    Constants.account: 'account',
    Constants.favoriteStore: 'favoriteStore',
  };
  //Set Up
  final instance = FakeFirebaseFirestore();
  late User item;
  late DocumentSnapshot<Map<String, dynamic>> snapshot;

  setUpAll(() async {
    await instance.collection('cart').doc('testUser').set(kMap);
    snapshot = await instance.collection('cart').doc('testUser').get();
  });

  setUp(() async {
    item = MockUser();
  });

  group('dataTransformation', () {
    test(
        'should call [toFirestore] once and return a json with the right data [kMap]',
        () async {
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
        'should call [fromFirestore] once and return a User with the right data',
        () async {
      //Arrange: You can't arrange with when since we are using different instances!
      final kUserFromFirestore = User.fromFirestore(
        snapshot,
        null,
      );

      // //Act
      final actual = User.fromFirestore(
        snapshot,
        null,
      );

      // //Assert
      expect(actual, isA<User>());
      expect(actual.username, equals(kUserFromFirestore.username));
    });

    test('should call [fromJson] and return a User with the right data',
        () async {
      //Arrange: You can't arrange with when since we are using different instances!
      final kUserFromJson = User.fromJson(
        kMap,
        null,
      );

      //Act
      final actual = User.fromJson(
        kMap,
        null,
      );

      //Assert
      expect(actual, isA<User>());
      expect(actual.username, equals(kUserFromJson.username));
    });
  });
}
