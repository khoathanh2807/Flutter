import 'package:flutter/material.dart';

import './string_screen.dart';
import './number_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: MainHome(),

    );

  }

}

class MainHome extends StatefulWidget {

  @override
  State<MainHome> createState() => _MainHomeState();

}

class _MainHomeState extends State<MainHome> {

  int selectedIndex = 0;

  final screens = [
    StringScreen(),
    NumberScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),

      bottomNavigationBar: BottomNavigationBar(

        elevation: 0,
        // type: BottomNavigationBarType.fixed,
        // iconSize: 22,
        // backgroundColor: Theme.of(context).colorScheme.surface,
        // selectedItemColor: Colors.teal,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        showUnselectedLabels: false,

        currentIndex: selectedIndex,

        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              activeIcon: Icon(Icons.article),     // wysiwyg
              label:  "String",
              backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              activeIcon: Icon(Icons.calculate),
              label:  "Number",
              backgroundColor: Colors.blue
          ),

        ],

      ),

    );

  }

}
