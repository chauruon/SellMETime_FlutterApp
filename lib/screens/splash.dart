import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            Color.fromARGB(255, 29, 67, 128),
            Color.fromARGB(255, 0, 19, 51),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(
          //   child: SvgPicture.asset(
          //     "assets/images/logo_sell_me_time.svg",
          //     width: 100,
          //     height: 100,
          //   ),
          // ),
          SizedBox(height: 20,),
          Text("ddd",
            style: TextStyle(
              fontSize: 157.4,

              fontWeight: FontWeight.w100,
              // color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}