import 'dart:math';

import 'package:ebin/models/b2c.dart';
import 'package:ebin/models/config.dart';
import 'package:ebin/models/stk_push.dart';
import 'package:ebin/models/tokens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MpesaPayment extends GetxController {
  Future<void> makePayment(String phoneNumber, int amount) async {
    String accessToken = await Tokens.generateToken();
    phoneNumber = '254${phoneNumber.substring(phoneNumber.length - 9)}';
    final StkPush payment = StkPush(
      businessShortCode: '174379',
      password: Tokens.getPassword(),
      timestamp: Tokens.getTimestamp(),
      transactionType: 'CustomerPayBillOnline',
      amount: amount.toString(),
      partyA: '600999',
      partyB: '600000',
      phoneNumber: phoneNumber,
      callBackURL: 'https://mydomain.com/pat',
      accountReference: 'E-bin',
      transactionDesc: 'Payments',
    );

    final Map<String, dynamic> body = payment.toJson();

    var response = await http.post(Uri.parse(Config.url),
        body: body, headers: {"Authorization": 'Bearer $accessToken'});

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle error
    }
  }

  //create a method for Business to Customer Using Daraja API
  Future<void> payCustomer(String phoneNumber, int amount) async {
    String accessToken = await Tokens.generateToken();
    debugPrint('string $accessToken');
    phoneNumber = '254${phoneNumber.substring(phoneNumber.length - 9)}';
    final BusinessToCustomer payment = BusinessToCustomer(
      originatorConversationID: generateRandomString(8),
      initiatorName: 'testapi',
      securityCredential: Tokens.getPassword(),
      commandID: 'BusinessPayment',
      amount: amount.toString(),
      partyA: "174379",
      partyB: phoneNumber,
      remarks: 'remarks',
      queueTimeOutURL: 'https://example.com',
      resultURL: 'https://example.com',
      occasion: 'occasion',
    );

    final Map<String, dynamic> body = payment.toJson();

    try {
      var response = await http.post(Uri.parse(Config.url),
          body: body, headers: {"Authorization": 'Bearer $accessToken'});
      if (response.statusCode == 200) {
        // Handle success
        debugPrint("succcess");
      } else {
        // Handle error
        debugPrint("error ${response.body}");
      }
    } on Exception catch (e) {
      debugPrint("error ${e.toString()}");
    }
  }

  String generateRandomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String result = '';
    for (int i = 0; i < length; i++) {
      result += chars[random.nextInt(chars.length)];
    }
    return result;
  }
}
