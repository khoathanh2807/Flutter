import 'package:flutter/material.dart';

import './airport/airport_screen.dart';
import './flight/flight_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity:VisualDensity.adaptivePlatformDensity,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: selectedIndex,
        children: [
          AirportScreen(),
          FlightScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
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
            icon: Icon(Icons.pin_drop_outlined),
            activeIcon: Icon(Icons.pin_drop),
            label:  'Airport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_outlined),
            activeIcon: Icon(Icons.airplane_ticket),
            label:  'Flight',
          ),
        ],

      ),

    );
  }

}