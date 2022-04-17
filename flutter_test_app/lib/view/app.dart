import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'SiteScreen.dart';

class xLMS_client extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'xLMS Client',
        theme: ThemeData(
          primaryColor: Colors.transparent,
        ),

        routes: {
          '/': (context) => LoginScreen(),
          '/SiteScreen': (context) => SiteScreen(),


        },
        initialRoute: '/',
      );
  }

}


