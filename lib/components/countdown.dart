import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  final int durationInSeconds;
  final bool startAutomatically;
  final TextStyle textStyle;

  const Countdown({
    Key? key,
    required this.durationInSeconds,
    this.startAutomatically = false,
    this.textStyle = const TextStyle(fontSize: 24),
  }) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  Timer? _timer;
  late Duration _remainingTime;

  bool runTime = false;

  @override
  void initState() {
    super.initState();
    _resetTimer();

    if (widget.startAutomatically) {
    log("222222222222222222222222 $runTime");
      _startTimer();
    }
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime -= const Duration(seconds: 1);
      });

      if (_remainingTime <= Duration.zero) {
        _timer?.cancel();
      }
    });
  }

  void _resetTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }

    setState(() {
      _remainingTime = Duration(seconds: widget.durationInSeconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _remainingTime.inMinutes;
    int seconds = _remainingTime.inSeconds.remainder(60);
    runTime = widget.startAutomatically;
    log("1111111111111111111111111 ${widget.startAutomatically}");

    return Text(
      '$minutes:${seconds.toString().padLeft(2, '0')}',
      style: widget.textStyle,
    );
  }
}
