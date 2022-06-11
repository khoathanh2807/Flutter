import 'package:flutter/material.dart';

import '../platform_alert.dart';
import './profile_tab.dart';
import './booking_history_tab.dart';

class InfoScreen extends StatefulWidget {

  @override
  State<InfoScreen> createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {

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
        title: Text('Tài khoản', style: TextStyle(fontWeight: FontWeight.w600,),),
        actions: [
          _logOut(),
          // SizedBox(width: 5,),
        ],
        bottom: TabBar(

          controller: _tabController,

          tabs: const [
            Text('Thông tin cá nhân'),
            Text('Lịch sử đặt vé'),
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

  Widget _logOut() {
    return IconButton(
      tooltip: 'Log Out',
      icon: const Icon(Icons.logout,),
      onPressed: () {
        FocusScope.of(context).unfocus();
        const logoutAlert = PlatformAlert(
          title: 'Đăng Xuất',
          message: 'Bạn xác nhận muốn đăng xuất tài khoản?',
        );
        logoutAlert.showLogoutAlert(context);
      },
    );
  }

}