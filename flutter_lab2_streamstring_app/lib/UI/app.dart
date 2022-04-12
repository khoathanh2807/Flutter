import 'package:flutter/material.dart';
import '../stream/string_stream.dart';

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return HomePageStream();
//   }
//
// }

class App extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<StatefulWidget> {

  StringStream stringStream = StringStream();

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream String',

      home: Scaffold(
        appBar: AppBar(title: Text('App Bar'),),
        backgroundColor: Colors.blueGrey,
        body: Text('Số Text đã nhận được: Counter = $counter'),
        floatingActionButton: FloatingActionButton(
          child: Text('Run'),
          onPressed: () {
            changeString();
          },
        ),
      ),
    );
  }

  changeString() async {

    stringStream.getStrings().listen(
      (eventString) {
        setState(() {
          counter++;
          print(eventString.toLowerCase());
          print('eventString = $eventString');
          print('counter = $counter');
        });
      }
    );

  }

}