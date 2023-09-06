import 'package:flutter/material.dart';

import '../components/bottom_navigation/custom_shaped_bottom_navigation.dart';

class DemoBottomNav extends StatefulWidget {
  const DemoBottomNav({super.key});

  @override
  State<DemoBottomNav> createState() => _DemoBottomNavState();
}

class _DemoBottomNavState extends State<DemoBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text("DemoBottomNav"),
        ),
      ),
      bottomNavigationBar: const CustomShapedBottomNavigation(),
    );
  }
}