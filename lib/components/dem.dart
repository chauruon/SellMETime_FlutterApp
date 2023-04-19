import 'dart:async';
import 'package:flutter/material.dart';


class DemNguoc extends StatefulWidget {
  final int durationInSeconds;
  final TextStyle textStyle;

  const DemNguoc({
    Key? key,
    required this.durationInSeconds,
    required this.textStyle,
  }) : super(key: key);

  @override
  _DemNguocState createState() => _DemNguocState();
}

class _DemNguocState extends State<DemNguoc> {
  late Timer _timer;
  int _remainingTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _startTimerAfterBuild();
  }

  Future<void> _startTimerAfterBuild() async {
    await Future.delayed(Duration.zero);
    _isRunning = true;
    _remainingTime = widget.durationInSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _remainingTime ~/ 60;
    int seconds = _remainingTime % 60;
    if (!_isRunning) {
      return Container();
    }
    return Text(
      '$minutes:${seconds.toString().padLeft(2, '0')}',
      style: widget.textStyle,
    );
  }
}



