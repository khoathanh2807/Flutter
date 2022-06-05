import 'package:flutter/material.dart';

import './inherited_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(myChild: MyCenterWidget(),),
    );
  }

}

class MyHomePage extends StatefulWidget {

  MyHomePage({required this.myChild}); // thêm dòng này

  final Widget myChild; // thêm dòng này

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    print('1. hàm build được gọi do hàm setState được gọi');

    return Scaffold(

      appBar: AppBar(
        title: Text('Test InheritedWidget'),
      ),

      body: MyInheritedWidget(
        myData: _counter, // data cần chia sẻ cho mấy widget child chính là counter
        child: widget.myChild, // child là sub tree từ MyCenterWidget xuống
        // child: MyCenterWidget(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

    );

  }

}

class MyCenterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('2. log build MyCenterWidget');
    return Center(
      // tiếp tục truyền data từ widget MyCenterWidget xuống MyText
      child: MyText(),
    );
  }

}

class MyText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final counter = MyInheritedWidget.of(context)?.myData;

    print('3. log build MyText với counter = $counter');
    return Text('Tui là widget Text. Data của tui hiện tại là: $counter');
  }

}