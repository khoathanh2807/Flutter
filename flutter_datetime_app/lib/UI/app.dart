import 'package:flutter/material.dart';

import './login_screen.dart';
import './home_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: "Datetime App",

      theme: ThemeData(
        primaryColor: Colors.teal,
        brightness: Brightness.dark,
      ),
      // home: HomeScreen(),

      routes: {  // khai bao cac duong dan den cac trang man hinh

        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),

      },

      initialRoute: '/login',

    );

  }

}