import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  // 1
  MyInheritedWidget({Widget? child, required this.myData}) : super(child: child!);

  // 2
  final int myData;

  // 3
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    // return false;
    // return myData != oldWidget.myData; // nếu data thay đổi thì return true để rebuild các widget con phụ thuộc
    return myData % 2 == 1;
  }

  // 4
  static MyInheritedWidget? of(BuildContext context){
    // 5
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}