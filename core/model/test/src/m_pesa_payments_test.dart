import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:model/src/cart_item.dart';
import 'package:model/src/constants.dart';
import 'package:model/src/m_pesa_payments.dart';

import 'cart_item_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MpesaResultPayment>()])
void main() {
  final kMap = {
    Constants.merchantRequestID: 'merchantRequestID',
    Constants.checkoutRequestID: 'checkoutRequestID',
    Constants.resultCode: 200,
    Constants.responseDescription: 'responseDescription',
    Constants.customerMessage: 'customerMessage',
  };
  //Set Up
  final instance = FakeFirebaseFirestore();
  late MpesaResultPayment item;
  late DocumentSnapshot<Map<String, dynamic>> snapshot;

  setUpAll(() async {
    await instance.collection('mpesa').doc('testMpesaItem').set(kMap);
    snapshot = await instance.collection('mpesa').doc('testMpesaItem').get();
  });

  setUp(() async {
    item = MockMpesaResultPayment();
  });

  group('dataTransformation', () {
    test(
        'should call [toFirestore] once and return a json with the right data [kJSON]',
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
        'should call [fromFirestore] once and return a MpesaResultPayment with the right data',
        () async {
      //Arrange: You can't arrange with when since we are using different instances!
      final kMpesaResultPaymentFromFirestore = MpesaResultPayment.fromFirestore(
        snapshot,
        null,
      );

      // //Act
      final actual = MpesaResultPayment.fromFirestore(
        snapshot,
        null,
      );

      // //Assert
      expect(actual, isA<MpesaResultPayment>());
      expect(actual.responseCode,
          equals(kMpesaResultPaymentFromFirestore.responseCode));
    });

    test(
        'should call [fromJson] and return a MpesaResultPayment with the right data',
        () async {
      //Arrange: You can't arrange with when since we are using different instances!
      final kMpesaResultPaymentFromJson = MpesaResultPayment.fromJson(
        kMap,
      );

      //Act
      final actual = MpesaResultPayment.fromJson(
        kMap,
      );

      //Assert
      expect(actual, isA<MpesaResultPayment>());
      expect(actual.responseCode,
          equals(kMpesaResultPaymentFromJson.responseCode));
    });
  });
}
