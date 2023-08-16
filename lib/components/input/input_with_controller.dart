import 'package:flutter/material.dart';
// import 'dart:developer';


class InputWithController extends StatefulWidget {
  const InputWithController({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  @override
  State<InputWithController> createState() => _MyTextFieldWithControllerState();
}

class _MyTextFieldWithControllerState extends State<InputWithController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        // onChanged: (value) => controller,
        controller:widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          
        ),
      ),
    );
  }
}