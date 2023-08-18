import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../utils/api.dart';
import '../utils/my_encription_decryption.dart';

class LoginController{
  final CallApi _api = CallApi();
  Future postLoginApi(email,password) async {
    try {
      final signature_key = DateTime.now().millisecondsSinceEpoch;
      const userId = "chauruon.lci@gmail.com";
      String? SIGNATURE_KEY_SALT = dotenv.env['SIGNATURE_KEY_SALT'];
      final hashPass = "$userId$signature_key";
      logger.d("3333333333333333333");
      final signatureValueJson = MyEncriptionDecryption.pbkdf2Password(hashPass, SIGNATURE_KEY_SALT!);
      logger.d("signatureValueJson %%%%%%%%%%%%%%      $signatureValueJson");
    } catch (e) {
      throw Exception("Failed to make API request");
    }
  }
}