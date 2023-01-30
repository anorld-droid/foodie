import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 30.01.2023.

class PaymentOptionsUseCase {
  final PaymentNetworkDataSource _paymentNetworkDataSource =
      PaymentNetworkDataSource();
  final CloudNetWorkDataSource _cloudNetWorkDataSource = Get.find();

  Future<String?> withMPesa(
      String userId, String amount, String phoneNumber, String item) async {
    final reqID = await _paymentNetworkDataSource.mPesa(
      amount,
      phoneNumber,
      item,
    );
    if (reqID != null) {
      MpesaResultPayment? mpesaResultPayment =
          await _getPaymentStatus(userId, reqID);
      if (mpesaResultPayment != null) {
        final int responseCode = int.parse(mpesaResultPayment.responseCode);
        return responseCode == 0 ? mpesaResultPayment.checkoutRequestID : null;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  /// Get the file to the specified path
  /// NOTE: doc should be user id
  Future<MpesaResultPayment?> _getPaymentStatus(
      String userId, String reqId) async {
    final snap = await _cloudNetWorkDataSource.getDoc<MpesaResultPayment>(
      collection: Constants.payments,
      doc: reqId,
      fromFirestore: MpesaResultPayment.fromFirestore,
      toFirestore: (MpesaResultPayment mpesaResultPayment, _) =>
          mpesaResultPayment.toFirestore(),
    );
    return snap.data();
  }
}
