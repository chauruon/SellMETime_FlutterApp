import 'dart:math';
import 'package:flutter/material.dart';

class ListButton extends StatefulWidget {
  final List<String> items;
  final Function(String, Color) onPressed;
  final List<Color> colors;

  const ListButton({
    Key? key,
    required this.items,
    required this.onPressed,
    required this.colors,
  }) : super(key: key);

  @override
  _ListButtonState createState() => _ListButtonState();
}

class _ListButtonState extends State<ListButton> {
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
        ? textcolors
        : bgcolors;

    return SizedBox(
      height: 50,
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
              decoration: BoxDecoration(
                color: isSelected ? color : bgcolors[index],
                borderRadius: BorderRadius.circular(10),
                border: isSelected
                    ? Border.all(
                        color: color,
                        width: 2,
                      )
                    : null,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(right: 8),
              child: Text(
                widget.items[index],
                style: const TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
