import 'package:flutter/material.dart';

import './login_screen.dart';

void main() {
  runApp(App());
}

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
);

class App extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.red,
      ),

      home: const LoginPage(title: 'Login UI'),

    );
  }

}
