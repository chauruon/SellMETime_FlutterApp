import 'package:flutter/material.dart';


class InputWithOnchange extends StatefulWidget {
  const InputWithOnchange({
    Key? key,
    required this.onchange,
    required this.hintText,
    required this.obscureText,
  }):super(key: key);

  // TextEditingValue? onchange;
  final ValueChanged<String>? onchange;
  final String hintText;
  final bool obscureText;

  @override
  State<InputWithOnchange> createState() => _MyTextFieldWithOnchangeState();
  
}

class _MyTextFieldWithOnchangeState extends State<InputWithOnchange> {

  void changeVal(val)=>{
    
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        onChanged: widget.onchange,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          
        ),
      ),
    );
  }
}