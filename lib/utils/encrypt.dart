import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:password_hash_plus/password_hash_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

Logger logger = Logger();

Future<Map<String, dynamic>?> encryptData(Map<String, dynamic> data) async {
  try {
    final signatureKey = DateTime.now().millisecondsSinceEpoch;
    final userId = data['userId'];
    final token = data['token'];
    final postNumber = data['postNumber'];
    final info = await PackageInfo.fromPlatform();

    logger.d("information %%%%%%% $info");

    String? SIGNATURE_KEY_SALT = dotenv.env['SIGNATURE_KEY_SALT'];
    String? SIGNATURE_KEY_HASH_COUNT = dotenv.env['SIGNATURE_KEY_HASH_COUNT'];
    String? SIGNATURE_KEY_SALT_DIGIT = dotenv.env['SIGNATURE_KEY_SALT_DIGIT'];
    String? appSec = dotenv.env['APP_SECKEY_SELL_ME_TIME_APP'];
    
    var generator = new PBKDF2();
    var salt = Salt.generateAsBase64String(SIGNATURE_KEY_SALT_DIGIT! as int);

    var signatureValueBytes = generator.generateKey("${userId}${signatureKey}", SIGNATURE_KEY_SALT!, SIGNATURE_KEY_HASH_COUNT! as int, SIGNATURE_KEY_SALT_DIGIT as int);
  
    final key = Key.fromBase64(appSec!);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final encryptedData = encrypter.encrypt(
      jsonEncode({
        'signature_value': base64Encode(signatureValueBytes),
        'signature_key': signatureKey.toString(),
        'userId': userId,
        'token': token,
        'postNumber': postNumber,
      }),
      iv: iv,
    );

    final json = {
      // 'app': appName,
      'data': encryptedData.base64,
    };

    return json;
  } catch (e) {
    print('encryptData ~ e $e');
    return null; // Handle the error appropriately
  }
}
