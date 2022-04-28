import 'package:flutter/material.dart';

import './home_screen.dart';
import './category_screen.dart';
import './flash_screen.dart';
import './chat_screen.dart';
import './info_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.teal,
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
    HomeScreen(),
    CategoryScreen(),
    FlashScreen(),
    ChatScreen(),
    InfoScreen()
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
        type: BottomNavigationBarType.fixed,
        // iconSize: 30,
        // backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        // showUnselectedLabels: false,

        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },

        currentIndex: selectedIndex,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label:  "Trang Chủ",
              backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label:  "Danh Mục",
              backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department_sharp),
              label:  "Lướt",
              backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_outlined),
              label:  "Chat",
              backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label:  "Cá Nhân",
              backgroundColor: Colors.blue
          ),
        ],

      ),

    );

  }

}