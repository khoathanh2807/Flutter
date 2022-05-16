import 'package:flutter/material.dart';

import './login_screen.dart';
import './home_screen.dart';
import './contacts_screen.dart';
import './info_screen.dart';

ColorScheme defaultColorScheme = const ColorScheme(
  primary: Colors.blue,
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
        colorScheme: defaultColorScheme,
        // primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeScreen(),

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
    ContactsScreen(),
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

                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  iconSize: 22,
                  // backgroundColor: Colors.white,
                  // backgroundColor: Theme.of(context).colorScheme.background,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  selectedItemColor: Colors.blue,
                  selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  selectedFontSize: 12,
                  unselectedFontSize: 11,
                  // showUnselectedLabels: false,

                  currentIndex: selectedIndex,

                  onTap: (index){
                    setState(() {
                      selectedIndex = index;
                    });
                  },

                  items: const [

                    BottomNavigationBarItem(
                        icon: Icon(Icons.chat_outlined),
                        activeIcon: Icon(Icons.chat),
                        label:  "Messages",
                        backgroundColor: Colors.blue
                    ),

                    BottomNavigationBarItem(
                        icon: Icon(Icons.contacts_outlined),
                        activeIcon: Icon(Icons.contacts),
                        label:  "Contacts",
                        backgroundColor: Colors.blue
                    ),

                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        activeIcon: Icon(Icons.person),
                        label:  "Me",
                        backgroundColor: Colors.blue
                    ),

                  ],

                ),

      // Material You Navigation Bar
      // bottomNavigationBar: NavigationBarTheme(
      //
      //     data: NavigationBarThemeData(
      //       indicatorColor: Colors.white.withOpacity(0.3),
      //       labelTextStyle: MaterialStateProperty.all(
      //         TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     child: NavigationBar(
      //       // backgroundColor: Colors.teal,
      //       // animationDuration: Duration(seconds: 2),
      //       labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      //       height: 60,
      //       selectedIndex: selectedIndex,
      //       onDestinationSelected: (int newIndex) {
      //         setState(() {
      //           selectedIndex = newIndex;
      //         });
      //       },
      //       destinations: [
      //         NavigationDestination(
      //             icon: Icon(Icons.chat_outlined),
      //             selectedIcon: Icon(Icons.chat),
      //             label: 'Messages'
      //         ),
      //         NavigationDestination(
      //             icon: Icon(Icons.contacts_outlined),
      //             selectedIcon: Icon(Icons.contacts),
      //             label: 'Contacts'
      //         ),
      //         NavigationDestination(
      //             icon: Icon(Icons.person_outline),
      //             selectedIcon: Icon(Icons.person),
      //             label: 'Me'
      //         )
      //       ],
      //     ),
      //
      // ),

    );

  }

}