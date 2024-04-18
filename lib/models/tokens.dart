import 'dart:convert';

import 'package:ebin/models/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Tokens {
  // Generate token for Daraja STK push
  static Future<String> generateToken() async {
    // Make a POST request to the token generation endpoint
    try {
      var response = await http.get(
        Uri.parse(
          'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials',
        ),
        headers: {"Authorization": 'Basic ${_token()}'},
      );
      // Check if the request was successful
      if (response.statusCode == 200) {
        // Extract the token from the response body
        Map<String, dynamic> token = jsonDecode(response.body);

        // Return the generated token
        return token['access_token'] ?? '';
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    // Return an empty string if the token generation fails
    return '';
  }

  //
  static String getPassword() {
    return base64.encode(utf8.encode(
        '${Config.businessShortCode}${Config.passkey}${getTimestamp()}'));
  }

  static String getTimestamp() {
    DateTime date = DateTime.now()
        .toUtc()
        .add(const Duration(hours: 3)); // Nairobi timezone
    String year = date.year.toString();
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String hour = date.hour.toString().padLeft(2, '0');
    String minute = date.minute.toString().padLeft(2, '0');
    String second = date.second.toString().padLeft(2, '0');
    return '$year$month$day$hour$minute$second';
  }

  static String _token() {
    return base64
        .encode(utf8.encode('${Config.consumerKey}:${Config.consumerSecret}'));
  }
}
