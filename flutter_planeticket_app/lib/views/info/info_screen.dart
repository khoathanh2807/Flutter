import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../settings/settings_screen.dart';
import './profile_tab.dart';
import './booking_history_tab.dart';

class InfoScreen extends StatefulWidget {

  InfoScreen({Key? key, required this.bookingHistory}) : super(key: key);

  bool bookingHistory;

  @override
  State<InfoScreen> createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {

    if (widget.bookingHistory == true) {
      selectedIndex = 1;
    }

    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: selectedIndex,
    );

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        // elevation: 0,
        centerTitle: true,
        title: Text('Account'.tr, style: TextStyle(fontWeight: FontWeight.w600,),),
        actions: [
          IconButton(
            tooltip: 'Settings',
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
          SizedBox(width: 5,),
        ],
        bottom: TabBar(

          controller: _tabController,

          tabs: [
            Text('ProfileInformation'.tr),
            Text('BookingHistory'.tr),
          ],

          indicatorColor: Colors.white,
          indicatorWeight: 2,

          labelPadding: EdgeInsets.only(top: 10, bottom: 10),
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),

          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },

        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15,),
          child: IndexedStack(

              index: selectedIndex,

              children: [
                ProfileTab(),
                BookingHistoryTab(),
              ],

          ),
        ),
      ),

    );

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

}