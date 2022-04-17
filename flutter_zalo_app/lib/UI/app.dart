import 'package:flutter/material.dart';

import './login_screen.dart';
import './home_screen.dart';
import './contacts_screen.dart';
import './info_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: "Zalo App",
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      // home: HomeScreen(),

      routes: {  // khai bao cac duong dan den cac trang man hinh

          '/': (context) => LoginScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          MainHome.route: (context) => MainHome(),
          ContactsScreen.route: (context) => ContactsScreen(),
          InfoScreen.route: (context) => InfoScreen(),

      },

      initialRoute: '/',

    );

  }

}



class MainHome extends StatefulWidget {

  static const route = '/home';

  @override
  State<MainHome> createState() => _MainHomeState();

}

class _MainHomeState extends State<MainHome> {

  int selectedIndex = 0;

  final screens = [
    HomeScreen(),
    ContactsScreen(),
    InfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        // home: Scaffold(

                body: IndexedStack(
                  index: selectedIndex,
                  children: screens,
                ),

                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  iconSize: 25,
                  // backgroundColor: Colors.white,
                  selectedItemColor: Colors.blue,
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

                  currentIndex: selectedIndex,

                  onTap: (index){
                    setState(() {
                      selectedIndex = index;
                    });
                  },

                  items: [

                    BottomNavigationBarItem(
                        icon: Icon(Icons.message),
                        label:  "Messages",
                        backgroundColor: Colors.blue
                    ),

                    BottomNavigationBarItem(
                        icon: Icon(Icons.contacts),
                        label:  "Contacts",
                        backgroundColor: Colors.blue
                    ),

                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label:  "Me",
                        backgroundColor: Colors.blue
                    ),

                  ],
                ),

        // ),

    );

  }

}