import 'package:flutter/material.dart';

import '../stream/text_stream.dart';

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

  TextStream textStream = TextStream();
  int counter = 0;
  String textMessage = '';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Text App 2',
      home: Scaffold(

        appBar: AppBar(title: Text('Demo Stream Text 2'),),
        backgroundColor: Colors.grey,

        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Text('Số Text đã nhận được: counter = $counter'),
                fieldTextMessage(),
              ],
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Text('Run'),
          onPressed: () {
            changeText();
          },
        ),

      ),
    );
  }

  Widget fieldTextMessage() {
    return Text(textMessage);
  }

  changeText() async {

    textStream.getTexts().listen(
      (eventText) {
        setState(() {

          counter++;
          print('counter = $counter');

          textMessage = textMessage + '\n' + eventText as String;
          print('eventText = $eventText');

        });
      }
    );

  }

}