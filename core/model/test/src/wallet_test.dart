import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/model.dart';
import 'package:model/src/constants.dart';

@GenerateNiceMocks([MockSpec<Wallet>()])
void main() {
  final kMap = {
    Constants.balance: 3456.09,
    Constants.borrowed: 123.98,
    Constants.creditLimit: 34000.78,
    Constants.validThru: Timestamp.fromDate(DateTime.now())
  };

  late Wallet wallet;
  final instance = FakeFirebaseFirestore();
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  //set up
  setUpAll(() async {
    await instance.collection('wallet').doc('testWallet').set(kMap);
    snapshot = await instance.collection('wallet').doc('testWallet').get();
  });

  setUp(() {
    wallet = MockWallet();
  });

  group('dataTransformations', () {
    test('should return json with the right data', () {
      //Arrange
      when(wallet.toFirestore()).thenAnswer((_) => kMap);

      //Act
      final actual = wallet.toFirestore();

      //Assert
      expect(actual, equals(kMap));
      verify(wallet.toFirestore()).called(1);
      verifyNoMoreInteractions(wallet);
    });

    test('should return [Wallet] with the right data', () {
      //Arrange

      //Act
      final actual = Wallet.fromFirestore(snapshot, null);

      //Assert
      expect(actual, isA<Wallet>());
    });
  });
}
