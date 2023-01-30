import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:network/src/constants.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 30.01.2023.
class STKPush {
  String basicAuth = 'Basic ${base64Encode(
    utf8.encode('${Constants.consumerKeySaf}:${Constants.consumerSecretSaf}'),
  )}';

  Future<AccessCredentials> getAccessCode() async {
    final response = await http.get(
        Uri.parse(
          'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials',
        ),
        headers: {'authorization': basicAuth});
    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    return AccessCredentials.fromJson(jsonResponse);
  }

  Future processRequest(amount, phoneNumber) async {
    final accessCredentials = await getClientCredentials();

    try {
      final response = await http.post(
          Uri.parse(
              'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest'),
          headers: {
            'Authorization': 'Bearer ${accessCredentials.accessToken}',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode({
            'BusinessShortCode': Constants.businessCode,
            'Password':
                'MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMjEwOTAxMTEwNTI4',
            'Timestamp': '20210901110528',
            'TransactionType': 'CustomerPayBillOnline',
            'Amount': amount,
            'PartyA': phoneNumber,
            'PartyB': Constants.businessCode,
            'PhoneNumber': phoneNumber,
            'CallBackURL': Constants.callbackUrl,
            'AccountReference': Constants.accountReference,
            'TransactionDesc': Constants.transactionDesc
          }));
    } catch (error) {
      // ignore: todo
      //TODO Log to firebase crashlytics
    }
  }
}

class AccessCredentials {
  final String accessToken;
  final String expiresIn;

  AccessCredentials({required this.accessToken, required this.expiresIn});

  factory AccessCredentials.fromJson(Map<String, dynamic> json) {
    return AccessCredentials(
      accessToken: json['access_token'] as String,
      expiresIn: json['expires_in'] as String,
    );
  }
}
