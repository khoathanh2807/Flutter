import 'package:flutter/material.dart';
import '../stream/color_stream.dart';

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

  Color bgTextColor = Colors.blueGrey;
  ColorStream colorStream = ColorStream();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Color',

      home: Scaffold(
        appBar: AppBar(title: Text('App Bar'),),
        backgroundColor: bgTextColor,
        body: Text('Press Run button to make background color change'),
        floatingActionButton: FloatingActionButton(
          child: Text('Run'),
          onPressed: () {
            changeColor();
          },
        ),
      ),
    );
  }

  changeColor() async {
    colorStream.getColors().listen(
        (eventColor) {
            setState(() {
              print(eventColor);
              bgTextColor = eventColor;
            });
        }
    );
  }

}