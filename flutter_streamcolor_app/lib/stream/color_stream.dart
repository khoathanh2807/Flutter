import 'package:flutter/material.dart';

class ColorStream {

  Stream<Color> getColors() async* {

    final List<Color> colors = [
      Colors.blueGrey,
      Colors.amber,
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.black26
    ];

    yield* Stream.periodic(Duration(seconds: 1), (int t) {
      int index = t % 5;
      return colors[index];
    });

  }

}