import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:password_hash_plus/password_hash_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoApp  extends GetxController{
  String app = "".obs as String;

  var packageInfo = {
    "app_name" : "".obs,
    "package_name" : "".obs,
    "version" : "".obs,
    "build_number" : "".obs,
    "build_signature" : "".obs,
    "installer_store" : "".obs,
  };
  
  void initinfo() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo['app_name'] = info.appName as RxString;
    packageInfo['package_name'] = info.packageName as RxString;
    packageInfo['version'] = info.version as RxString;
    packageInfo['build_number'] = info.buildNumber as RxString;
    packageInfo['build_signature'] = info.buildSignature as RxString;
    packageInfo['installer_store'] = info.installerStore as RxString;
  }
}