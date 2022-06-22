import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../controllers/language/language_controller.dart';
import '../inherited_widget.dart';
import './auth/login_screen.dart';
import './home/home_screen.dart';
import 'booking/booking_screen.dart';
import 'info/info_screen.dart';

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

  // App({Key? key, required this.isPressedNotification}) : super(key: key);

  // bool isPressedNotification;

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      translations: LanguageController(),
      locale: const Locale('English'),

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          // colorScheme: defaultColorScheme,
          primarySwatch: Colors.teal,
          // brightness: Brightness.dark,
          visualDensity:VisualDensity.adaptivePlatformDensity,
      ),

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> userSnapshot) {
          if (userSnapshot.hasData) {
            // if (isPressedNotification){
            //   return MainHome(tabIndex: 2, bookingHistory: true,);
            // }
            return MainHome(tabIndex: 0, bookingHistory: false,);
          }
          return LoginScreen();
        },
      ),

    );

  }

}

class MainHome extends StatefulWidget {

  MainHome({Key? key, required this.tabIndex, required this.bookingHistory}) : super(key: key);

  int tabIndex;
  bool bookingHistory;

  @override
  State<MainHome> createState() => _MainHomeState();

}

class _MainHomeState extends State<MainHome> {

  // final _bottomNavigationBarKey = GlobalKey<State<BottomNavigationBar>>();

  int selectedIndex = 0;

  // final screens = [
  //   HomeScreen(),
  //   BookingScreen(),
  //   InfoScreen(),
  // ];

  @override
  void initState() {
    selectedIndex = widget.tabIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body: IndexedStack(
        index: selectedIndex,
        children: [
          InheritedBottomNavBar(
            bottomNavBar: planeTicketAppBottomNavBar(),
            widgetChild: HomeScreen(),
          ),
          BookingScreen(),
          InfoScreen(bookingHistory: widget.bookingHistory),
        ],
      ),

      bottomNavigationBar: planeTicketAppBottomNavBar(),

    );

  }

  BottomNavigationBar planeTicketAppBottomNavBar() {

    return BottomNavigationBar(

      // elevation: 0,
      // key: _bottomNavigationBarKey,
      type: BottomNavigationBarType.fixed,
      // iconSize: 25,
      // backgroundColor: Colors.white,
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

      items: [

        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'HomeScreen'.tr,
          // backgroundColor: Colors.teal,
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.airplane_ticket_outlined),
          activeIcon: Icon(Icons.airplane_ticket),
          label: 'BookingTicket'.tr,
          // backgroundColor: Colors.teal,
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Account'.tr,
          // backgroundColor: Colors.teal,
        ),

      ],

    );

  }

  // void navigateTab(int index, BuildContext context) {
  //   BottomNavigationBar bottomNavigationBar =  _bottomNavigationBarKey.currentWidget as BottomNavigationBar;
  //   bottomNavigationBar.onTap!(index);
  // }

}