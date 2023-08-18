// import 'package:http/http.dart' as http;
// import 'package:crypto/crypto.dart';
// import 'package:pointycastle/api.dart';
// import 'package:intl/intl.dart';
// import 'package:encrypt/encrypt.dart';
// import 'package:pointycastle/export.dart';

// final uriSellMeTime = Config.API_SELL_ME_TIME;
// final appName = Config.APP_SELL_ME_TIME_APP;
// final appSec = Config.APP_SECKEY_SELL_ME_TIME_APP;
// final SIGNATURE_KEY_HASH_COUNT = int.parse(Config.SIGNATURE_KEY_HASH_COUNT);
// final SIGNATURE_KEY_SALT = Config.SIGNATURE_KEY_SALT;
// final SIGNATURE_KEY_SALT_DIGIT = int.parse(Config.SIGNATURE_KEY_SALT_DIGIT);

// final fcmToken = Config.FCM_TOKEN;

// Future<Map<String, String>> encryptData(Map<String, dynamic> data) async {
//   try {
//     final signature_key = DateTime.now().millisecondsSinceEpoch;
//     final userId = data['userId'];
//     final token = data['token'];
//     final postNumber = data['postNumber'];

//     final signatureValueBytes = PBKDF2KeyDerivator()
//         ..init(Pbkdf2Parameters(
//             Hmac(SHA256Digest(), utf8.encode('${userId}${signature_key}')),
//             utf8.encode(SIGNATURE_KEY_SALT),
//             SIGNATURE_KEY_HASH_COUNT,
//             SIGNATURE_KEY_SALT_DIGIT));

//     final signatureValueJson = signatureValueBytes.process(utf8.encode(''));

//     final key = Key.fromUtf8(appSec);
//     final iv = IV.fromLength(16);

//     final encrypter = Encrypter(AES(key, mode: AESMode.ecb));
//     final encrypted = encrypter.encrypt(
//       json.encode({
//         'signature_value': base64.encode(signatureValueJson),
//         'signature_key': signature_key,
//         'userId': userId,
//         'token': token,
//         'postNumber': postNumber,
//       }),
//       iv: iv,
//     );

//     final jsonMap = {
//       'app': appName,
//       'data': encrypted.base64,
//     };

//     return jsonMap;
//   } catch (e) {
//     print("encryptData ~ e $e");
//     return {}; // Handle error appropriately
//   }
// }

// void main() async {
//   // Test your encryptData function
//   final data = {
//     'userId': 'yourUserId',
//     'token': 'yourToken',
//     'postNumber': 'yourPostNumber',
//   };
  
//   final encryptedData = await encryptData(data);
//   print(encryptedData);
// }
