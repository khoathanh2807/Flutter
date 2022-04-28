import 'package:flutter/material.dart';

import './login_screen.dart';
import './home_screen.dart';

ColorScheme defaultColorScheme = const ColorScheme(
  primary: Colors.teal,
  secondary: Color(0xff03DAC6),
  surface: Color(0xff181818),
  background: Color(0xff121212),
  error: Color(0xffCF6679),
  onPrimary: Color(0xff000000),
  onSecondary: Color(0xff000000),
  onSurface: Color(0xffffffff),
  onBackground: Color(0xffffffff),
  onError: Color(0xff000000),
  brightness: Brightness.dark,
  // brightness: Brightness.light
);

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: "Sakai Service App",

      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
        visualDensity:VisualDensity.adaptivePlatformDensity,
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