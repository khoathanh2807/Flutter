import 'package:flutter/material.dart';

import './shape_animation.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<StatefulWidget> {

  final List<double> sizes = [100, 125, 150, 175, 200];
  final List<double> tops = [0, 50, 100, 150, 200];

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.orange
  ];

  int iteration = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Animated Container'),
        actions: [
          TextButton(
            child: Text('Ball'),
            style: TextButton.styleFrom(primary: Colors.white,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShapeAnimation()));
            },
          ),
          IconButton(
            icon: Icon(Icons.run_circle),
            onPressed: () {
                iteration < colors.length - 1 ? iteration++ : iteration = 0;
                setState(() {
                });
            },
          )
        ],
      ),

      body: Center(
        child: AnimatedContainer(

          width: sizes[iteration],
          height: sizes[iteration],

          color: colors[iteration],

          duration: Duration(seconds: 1),

          margin: EdgeInsets.only(top: tops[iteration]),

        ),
      ),

    );

  }

}