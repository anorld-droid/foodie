import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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

  Future<String?> invoke(
      String amount, String mobileNumber, String item) async {
    String phoneNumber = mobileNumber.substring(1);
    final accessCredentials = await getAccessCode();
    var date = DateTime.now();
    var timestamp = DateFormat('yyyyMMddHHmmss').format(date);
    final String password = base64Encode(
      utf8.encode('${Constants.businessCode}${Constants.passKey}$timestamp}'),
    );

    try {
      final response = await http.post(
        Uri.parse(
            'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest'),
        headers: {
          'Authorization': 'Bearer ${accessCredentials.accessToken}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(
          {
            'BusinessShortCode': Constants.businessCode,
            'Password':
                'MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMTYwMjE2MTY1NjI3',
            'Timestamp': '20160216165627',
            'TransactionType': 'CustomerPayBillOnline',
            'Amount': amount,
            'PartyA': phoneNumber,
            'PartyB': Constants.businessCode,
            'PhoneNumber': phoneNumber,
            'CallBackURL': Constants.callbackUrl,
            'AccountReference': Constants.accountReference,
            'TransactionDesc': '${Constants.transactionDesc}$item'
          },
        ),
      );
      var json = jsonDecode(response.body);
      return json['CheckoutRequestID'] as String;
    } catch (error) {
      // ignore: todo
      //TODO Log to firebase crashlytics
      return null;
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
