import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './login_screen.dart';
import './home_screen.dart';
import './setting_screen.dart';
import './newedit_pizza.dart';
import './platform_alert.dart';
import '../models/pizza.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Pizza defaultPizza = Pizza.createDefault();

    return MaterialApp(

      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity:VisualDensity.adaptivePlatformDensity
      ),
      // home: MainHome(),

      routes: {
        '/': (context) => MainHome(),
        '/login': (context) => LoginScreen(),
        '/add_pizza': (context) => NewEditPizza(pizza: defaultPizza),

      },
      initialRoute: '/login',

    );

  }

}

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  int selectedIndexBottomNavBar = 0;
  final screens = [
    HomeScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        children: screens,
        index: selectedIndexBottomNavBar,
      ),

      bottomNavigationBar: _buildBottomMenu(),

      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.notifications),

        onPressed: () async {

          // Get stored appCounter
          SharedPreferences prefs = await SharedPreferences.getInstance();

          var appCounter = prefs.getInt('appCounter') ?? 0;

          final alert = PlatformAlert(
            title: 'Times of opened app',
            message: 'Your have opened this app $appCounter times.',
          );

          alert.show(context);

        },

      ),

    );
  }

  BottomNavigationBar _buildBottomMenu() {

    return BottomNavigationBar(

      currentIndex: selectedIndexBottomNavBar,
      onTap: _onBottomMenuTap,

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],

    );

  }

  void _onBottomMenuTap(int index) {
    setState(() {
      selectedIndexBottomNavBar = index;
    });
  }

}