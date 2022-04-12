import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/pizza.dart';
import './home_screen.dart';
import './list_pizza.dart';
import './newedit_pizza.dart';
import './setting_screen.dart';
import './platform_alert.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Pizza defaultPizza = Pizza.createDefault();

    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity:VisualDensity.adaptivePlatformDensity
      ),
      // home: MyHomePage(),

      routes: {
        '/': (context) => MyHomePage(),
        '/add_pizza': (context) => NewEditPizza(pizza: defaultPizza),
        '/list_pizza': (context) => ListPizzaScreen(),
      },
      initialRoute: '/',

    );

  }

}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedIndexBottomMenu = 0;
  final screens = [
    HomeScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foodlist'),
        actions: [
          _addPizza()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.notifications),
        onPressed: () async {
          // Get stored appCounter
          SharedPreferences prefs = await SharedPreferences.getInstance();

          var appCounter = prefs.getInt('appCounter') ?? 0;

          final alert = PlatformAlert(
            title: 'Times of opened app',
            message: 'Your have opened the app is $appCounter times.',
          );
          alert.show(context);
        },
      ),
      body: IndexedStack(
        children: screens,
        index: selectedIndexBottomMenu,
      ),
      bottomNavigationBar: _buildBottomMenu(),
    );
  }

  BottomNavigationBar _buildBottomMenu() {
    return BottomNavigationBar(
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
      currentIndex: selectedIndexBottomMenu,
      onTap: _onBottomMenuTap,
    );
  }

  void _onBottomMenuTap(int value) {
    setState(() {
      selectedIndexBottomMenu = value;
    });
  }

  Widget _addPizza() {
    Pizza defaultPizza = Pizza.createDefault();
    return IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/add_pizza');
          // Navigator.push(context, MaterialPageRoute(
          //     builder: (context) => NewEditPizza(pizza: defaultPizza)
          // ));
         },
        icon: Icon(Icons.add),
        tooltip: 'Add Pizza',
    );
  }

}