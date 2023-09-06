import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/key_derivators/api.dart';
import 'package:pointycastle/key_derivators/pbkdf2.dart';
import 'package:pointycastle/macs/hmac.dart';
import 'package:conduit_password_hash/conduit_password_hash.dart';
import '../utils/api.dart';
import '../utils/my_encription_decryption.dart';

class LoginController{
  final CallApi _api = CallApi();
  String? signatureKeyHashCount1 = dotenv.env['SIGNATURE_KEY_HASH_COUNT'];
  String? signatureKeySaltDigit1 = dotenv.env['SIGNATURE_KEY_SALT_DIGIT'];
  
  int? get signatureKeyHashCount => signatureKeyHashCount1 as int;
  int get signatureKeySaltDigit => signatureKeySaltDigit1 as int;




  Future<String> postLoginApi(email,password) async {
    try {
      final signatureKey = DateTime.now().millisecondsSinceEpoch;
      const userId = "chauruon.lci@gmail.com";
      String? signatureKeySalt = dotenv.env['SIGNATURE_KEY_SALT'];

      // var generator = PBKDF2();
      // var salt = generateAsBase64String(signatureKeyHashCount!);
      // late List<int> hash = generator.generateKey("mytopsecretpassword", salt, 1000, 32);
      // logger.d("3333333333333333333     $hash");

      final hashPass = "$userId$signatureKey";
      late String signatureValueJson = MyEncriptionDecryption.pbkdf2Password(hashPass, signatureKeySalt!);
      logger.d("signatureValueJson %%%%%%%%%%%%%%      $signatureValueJson");

      logger.d("%%%%%%%%%%%%%%   $hashPass");
      return "dkjghagag";
      // return signatureValueJson;
    } catch (e) {
      throw Exception("Failed to make API request");
    }
  }

  String pbkdf2Password(String password, String salt) {
    final saltBytes = Uint8List.fromList(utf8.encode(salt));
    final passwordBytes = Uint8List.fromList(utf8.encode(password));

    // final pbkdf2 = PBKDF2KeyDerivator(HMac(SHA256Digest(), 64, blockSize: 32));
    final pbkdf2 = PBKDF2KeyDerivator( HMac(SHA256Digest(), 64) );
    pbkdf2.init(Pbkdf2Parameters(saltBytes, signatureKeyHashCount!, signatureKeySaltDigit));

    final key = pbkdf2.process(passwordBytes);
    final encodedPassword = base64.encode(key);
    logger.d("vpbkdf2Password  $encodedPassword");
    return encodedPassword;
  }
}