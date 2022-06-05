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
    return myData != oldWidget.myData; // nếu data thay đổi thì return true để rebuild các widget con phụ thuộc
  }

  // 4
  static MyInheritedWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

}

class InheritedBottomNavBar extends InheritedWidget {

  InheritedBottomNavBar({Key? key, Widget? widgetChild, required this.bottomNavBar}) : super(key: key, child: widgetChild!);

  BottomNavigationBar bottomNavBar;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static InheritedBottomNavBar? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<InheritedBottomNavBar>();
  }

}