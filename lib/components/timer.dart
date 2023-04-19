import 'dart:async';

import 'package:flutter/material.dart';


class TimerComponent extends StatelessWidget {
  final int durationInSeconds;
  final TextStyle textStyle;

  const TimerComponent({
    Key? key,
    required this.durationInSeconds,
    this.textStyle = const TextStyle(fontSize: 14),
  }) : super(key: key);

  @override
    Widget build(BuildContext context) {
    Stream<int> countdownStream = Stream.periodic(
      const Duration(seconds: 1),
      (count) => durationInSeconds - count - 1,
    ).take(durationInSeconds);

    return StreamBuilder<int>(
      stream: countdownStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text(
            'Loading...',
            style: textStyle,
          );
        }

        int remainingTime = snapshot.data!;
        int minutes = remainingTime ~/ 60;
        int seconds = remainingTime % 60;

        return Text(
          '$minutes:${seconds.toString().padLeft(2, '0')}',
          style: textStyle,
        );
      },
    );
  }

}
