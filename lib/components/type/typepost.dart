import 'dart:math';
import 'package:flutter/material.dart';

class TypePostComponent extends StatefulWidget {
  final List<String> items;
  final Function(String, Color) onPressed;
  final List<Color> colors;

  const TypePostComponent({
    Key? key,
    required this.items,
    required this.onPressed,
    required this.colors,
  }) : super(key: key);

  @override
  _ListButtonState createState() => _ListButtonState();
}

class _ListButtonState extends State<TypePostComponent> {
  late List<bool> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List<bool>.filled(widget.items.length, false);
  }


  final List<Color> bgcolors = const[
    Color.fromRGBO(228, 241, 255, 1),
    Color.fromRGBO(255, 248, 228, 1),
    Color.fromRGBO(255, 213, 213, 1),
  ];
  final List<Color> textcolors = const[
    Color.fromRGBO(37, 103, 249, 1),
    Color.fromRGBO(255, 178, 0, 1),
    Color.fromRGBO(218, 0, 11, 1),
  ];


  @override
  Widget build(BuildContext context) {
    final colors = widget.colors.length == widget.items.length
        ? widget.colors
        : [Colors.red, Colors.blue, Colors.green];

    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final isSelected = _selected[index];
          final color = colors[index % colors.length];

          return GestureDetector(
            onTap: () {
              setState(() {
                _selected = List<bool>.filled(widget.items.length, false);
                _selected[index] = true;
              });

              widget.onPressed(widget.items[index], color);
            },
            child: Container(
              alignment: Alignment.center,
              width: 60,
              decoration: BoxDecoration(
                color: isSelected ? color : widget.colors[index],
                borderRadius: BorderRadius.circular(25),
                border: isSelected
                    ? Border.all(
                        color: textcolors[index],
                        width: 1,
                      )
                    : null,
              ),
              // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(right: 8),
              child: Text(
                widget.items[index],
                style: TextStyle(
                  fontSize: 10,
                  color: textcolors[index],
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
