import 'package:flutter/material.dart';

import './login_screen.dart';
import './home_screen.dart';
import './booking_screen.dart';
import './info_screen.dart';

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

      theme: ThemeData(
          // colorScheme: defaultColorScheme,
          primarySwatch: Colors.teal,
          // brightness: Brightness.dark,
          visualDensity:VisualDensity.adaptivePlatformDensity,
      ),

      routes: {  // khai bao cac duong dan den cac trang man hinh

        '/': (context) => const MainHome(),
        '/login': (context) => const LoginScreen(),

      },

      initialRoute: '/login',

    );

  }

}

class MainHome extends StatefulWidget {

  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();

}

class _MainHomeState extends State<MainHome> {

  int selectedIndex = 0;

  final screens = [
    HomeScreen(),
    BookingScreen(),
    InfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),

      bottomNavigationBar: BottomNavigationBar(

        // elevation: 0,
        type: BottomNavigationBarType.fixed,
        // iconSize: 25,
        // backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
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
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label:  "Trang chủ",
              backgroundColor: Colors.teal,
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_outlined),
              activeIcon: Icon(Icons.airplane_ticket),
              label:  "Đặt vé",
              backgroundColor: Colors.teal,
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label:  "Tài khoản",
              backgroundColor: Colors.teal,
          ),

        ],

      ),

    );

  }

}