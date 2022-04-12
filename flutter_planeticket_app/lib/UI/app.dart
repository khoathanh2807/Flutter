import 'package:flutter/material.dart';
import './login_screen.dart';
import './home.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      routes: {  // khai bao cac duong dan den cac trang man hinh
        '/': (context) => LoginScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        HomeScreen.route: (context){
          return HomeScreen();
        }
      },

      initialRoute: '/',

    );

  }

}