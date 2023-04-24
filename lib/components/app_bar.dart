import 'dart:developer';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {


  const CustomAppBar({
    super.key,
    required this.icon,
    this.title,
    this.textstyle,
    this.arrayAcction,
    this.elevation,
    this.backgroundColor,
    this.currentStep = -1,
    this.onPressStep,
  }):assert(0 <= currentStep);
  
  
  final Function(int)? onPressStep;
  final Text? title;
  final TextStyle? textstyle;
  final String icon;
  final List<Widget>? arrayAcction;
  final double? elevation;
  final Color? backgroundColor;
  final int currentStep;

  @override
  Size get preferredSize => const Size(double.infinity,40.0);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    // log("currentStep ${widget.currentStep}");
    int step = widget.currentStep != -1 ? widget.currentStep : -1;

    return AppBar(        
        leading: IconButton(
          icon: Image.asset(
            widget.icon,
            width: 20,
            height: 20,
          ),
          onPressed: () { 
            if (step >= 0 ) {
                setState(() {
                  step -= 1;
                });
              log("step $step");
              widget.onPressStep!(step != -1 ? step : 0) ;
              if(step == -1) {
                Navigator.pop(context);
              }
            }else{
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: true,
        title: widget.title,
        elevation: widget.elevation ?? widget.elevation,
        backgroundColor: widget.backgroundColor ?? widget.backgroundColor,
        actions: widget.arrayAcction,
    );
  }
}