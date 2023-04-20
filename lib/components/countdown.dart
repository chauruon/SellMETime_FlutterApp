import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';

class Countdown extends StatefulWidget {
  final int durationInSeconds;
  final TextStyle textStyle;
  final bool startCount;
 final Function(bool) onFinish;

  const Countdown({
    Key? key,
    required this.durationInSeconds,
    required this.startCount,
    required this.textStyle,
    required this.onFinish,
  }) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late Timer _timer;
  int _remainingTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    log("asdfjhsagdfajdf ${widget.startCount}");
    _startTimerAfterBuild();
  }

  Future<void> _startTimerAfterBuild() async {
    await Future.delayed(Duration.zero);
    _isRunning = widget.startCount;
    _remainingTime = widget.durationInSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          _isRunning = false;
          widget.onFinish(_isRunning);

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
    // Duration remainingDuration = Duration(seconds: _remainingTime);
    // int minutes = remainingDuration.inMinutes;
    // int seconds = remainingDuration.inSeconds.remainder(60);

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
