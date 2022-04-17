import 'package:flutter/material.dart';

class TextStream {

  Stream<String> getTexts() async* {

    final List<String> texts = [
      'String 01',
      'String 02',
      'String 03',
      'String 04',
      'String 05'
    ];

    yield* Stream.periodic(Duration(seconds: 1), (int t) {
      print('t = $t');
      int index = t % 5;
      return texts[index];
    });

  }

}