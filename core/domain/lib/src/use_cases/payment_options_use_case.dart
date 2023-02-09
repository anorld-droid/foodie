import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 30.01.2023.

class PaymentOptionsUseCase {
  final PaymentNetworkDataSource _paymentNetworkDataSource =
      PaymentNetworkDataSource();
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  Future<String?> withMPesa(
      String userId, String amount, String phoneNumber, String item) async {
    return await _paymentNetworkDataSource.mPesa(
      amount,
      phoneNumber,
      item,
    );
  }

  /// Return payments collection stream
  /// NOTE: doc should be user id
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>>
      getPaymentStatus<MpesaResultPayment>({
    required String reqId,
  }) async {
    return await _cloudNetWorkDataSource
        .getCollectionStream<MpesaResultPayment>(
      collection: Constants.payments,
    );
  }
}
