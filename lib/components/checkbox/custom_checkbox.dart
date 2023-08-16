import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({
    Key? key,
    required this.valCheck,
  }) 
  : super(key: key);

  bool? valCheck;

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    print("customcheckbox ${widget.valCheck}" );
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _value = !_value;
            widget.valCheck = _value ;
          });
        },
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5)
                ),
                border: Border.all(width: 2),
                color: _value ? Colors.black : Colors.transparent,
              ),
              child: _value
                ? const Icon(
                  Icons.check,
                  size: 15.0,
                  color: Colors.white,
                )
                : const Icon(
                  Icons.check_box_outline_blank,
                  size: 15.0,
                  color: Colors.transparent,

                ),
            ),
            const SizedBox(width: 5,),
            const Text("Activity date"),
          ],
        ),
      ),
    );
  }
}