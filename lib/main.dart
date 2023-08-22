
import 'package:get/get.dart';
import 'package:sellmetime/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sellmetime/screens/my_cart.dart';

import 'components/bottom_navigation/custom_shaped_bottom_navigation.dart';
import 'controller/info_app.dart';
import 'screens/splash.dart';

  // final InfoApps = Get.put(InfoApp());
void main() async {
  await dotenv.load(fileName: ".env");
  PackageInfo.fromPlatform();
  // InfoApps.initinfo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        // child: const LoginScreen(),
        // child: const MyCart(),
        // child: const SplashScreen(),
        child: const CustomShapedBottomNavigation(),
      ),
    );
  }
}
