import 'package:flutter/material.dart';

import '../stream/string_stream.dart';

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return HomePageStream();
//   }
// }

class App extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<StatefulWidget> {

  TextStream stringStream = TextStream();
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Text App',
      home: Scaffold(

        appBar: AppBar(title: Text('Demo Stream Text'),),

        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Text('Số Text đã nhận được: counter = $counter'),
        ),

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

    stringStream.getTexts().listen(
      (eventText) {
        setState(() {

          counter++;
          print('counter = $counter');

          print(eventText.toLowerCase());
          print('eventText = $eventText');

        });
      }
    );

  }

}