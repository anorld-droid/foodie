// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 30.01.2023.

import 'package:network/network.dart';

class PaymentNetworkDataSource {
  final STKPush _stkPush = STKPush();

  Future<String?> mPesa(String amount, String phoneNumber, String item) async {
    return await _stkPush.invoke(
      amount,
      phoneNumber,
      item,
    );
  }

  Future<String?> airteMoney(
      String amount, String phoneNumber, String item) async {
    return await _stkPush.invoke(
      amount,
      phoneNumber,
      item,
    );
  }
}
