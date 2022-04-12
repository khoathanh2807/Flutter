import 'package:flutter/material.dart';

class StringStream {

  Stream<String> getStrings() async* {

    final List<String> strings = [
      'String 01',
      'String 02',
      'String 03',
      'String 04',
      'String 05'
    ];

    yield* Stream.periodic(Duration(seconds: 1), (int t) {
      print('t = $t');
      int index = t % 5;
      return strings[index];
    });

  }

}