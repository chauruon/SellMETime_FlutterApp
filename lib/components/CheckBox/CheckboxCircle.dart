import 'package:flutter/material.dart';

class CheckboxCircle extends StatefulWidget {
  CheckboxCircle({
    Key? key,
    required this.valCheck,
    this.index,
    this.label,
  }) : super(key: key);

  bool valCheck = false;
  int? index;
  String? label;

  @override
  _CheckboxCircleState createState() => _CheckboxCircleState();
}

class _CheckboxCircleState extends State<CheckboxCircle> {
  bool _valcheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 0.0, right: 0.0),
          child: Checkbox(
            checkColor: Colors.white,
        
            activeColor: Colors.black,
            side: const BorderSide(
              width: 2,
              color: Colors.black,
            ),
            shape: const CircleBorder(),
            value: _valcheck,
            onChanged: (bool? value) {
              setState(() {
                _valcheck = value!;
                widget.valCheck = _valcheck;
              });
            },
          ),
        ),
        
        if (widget.label != null) 
          Container(
            alignment: AlignmentDirectional.centerStart,
            // color: Colors.redAccent,
            width: 90,
            height: 30,
            margin: const EdgeInsets.only(left: 0.0,),
            child: Text(
              "${widget.label}",
              style: const TextStyle(
                fontSize: 16,
                overflow: TextOverflow.fade,
                // decorationStyle: TextDecorationStyle.dashed,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.black,
                decorationThickness: 2.0,

              ),
            ),
          ),
      ],
    );
  }
}