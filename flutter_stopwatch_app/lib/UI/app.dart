import 'package:flutter/material.dart';
import './login_screen.dart';
import './stopwatch_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.teal,
        // brightness: Brightness.dark,
        visualDensity:VisualDensity.adaptivePlatformDensity,
      ),

      routes: {   // khai bao cac duong dan den cac trang man hinh
          '/': (context) => LoginScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          StopwatchScreen.route: (context){
              return StopwatchScreen();
          }
      },

      initialRoute: '/',

    );

  }

}