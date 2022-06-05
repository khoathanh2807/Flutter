import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HideOnScroll extends StatefulWidget {

  const HideOnScroll({Key? key}) : super(key: key);

  @override
  _HideOnScrollState createState() => _HideOnScrollState();

}

class _HideOnScrollState extends State<HideOnScroll> with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {

    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    _pages = <Widget>[

      CallsPage(
        isHideBottomNavBar: (isHideBottomNavBar) {
          isHideBottomNavBar ? animationController.forward() : animationController.reverse();
        },
      ),

      const Center(
        child: Icon(
          Icons.camera,
          size: 150,
        ),
      ),

      const Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
              labelText: 'Find contact',
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),

    ];

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Auto Hide TabBar Demo App'),
        elevation: 0,
      ),

      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),

      bottomNavigationBar: SizeTransition(

        sizeFactor: animationController,
        axisAlignment: -1.0,

        child: BottomNavigationBar(

          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
          ],

        ),

      ),

    );

  }

  @override
  void dispose() {
    // ...
    animationController.dispose();
    super.dispose();
  }

}

class CallsPage extends StatelessWidget {

  CallsPage({required this.isHideBottomNavBar});

  final Function(bool) isHideBottomNavBar;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(

      length: 3,

      child: Scaffold(

        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(text: 'Incoming',),
                  Tab(text: 'Outgoing',),
                  Tab(text: 'Missed',),
                ],
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            IncomingPage(),
            OutgoingPage(
              isHideBottomNavBar: (value) {
                isHideBottomNavBar(value);
              },
            ),
            Icon(Icons.call_missed_outgoing, size: 350),
          ],
        ),

      ),

    );

  }

}

class IncomingPage extends StatefulWidget {

  @override
  _IncomingPageState createState() => _IncomingPageState();

}

class _IncomingPageState extends State<IncomingPage> with AutomaticKeepAliveClientMixin<IncomingPage> {

  int count = 999;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call_received, size: 350),
              Text('Total incoming calls: $count', style: TextStyle(fontSize: 30)),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: clear,
          child: Icon(Icons.clear_all),
        )

    );

  }

  void clear() {
    setState(() {
      count = 0;
    });
  }

  @override
  bool get wantKeepAlive => true;

}

class OutgoingPage extends StatefulWidget {

  OutgoingPage({required this.isHideBottomNavBar});

  final Function(bool) isHideBottomNavBar;

  @override
  _OutgoingPageState createState() => _OutgoingPageState();

}

class _OutgoingPageState extends State<OutgoingPage> with AutomaticKeepAliveClientMixin<OutgoingPage> {

  final items = List<String>.generate(1000, (i) => "Call ${i+1}");

  bool _handleScrollNotification(ScrollNotification notification) {

    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            widget.isHideBottomNavBar(true);
            break;
          case ScrollDirection.reverse:
            widget.isHideBottomNavBar(false);
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }

    return false;

  }

  @override
  Widget build(BuildContext context) {

    return NotificationListener<ScrollNotification>(

      onNotification: _handleScrollNotification,

      child: Scaffold(

        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30,),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${items[index]}',),
              );
            },
          ),
        ),

      ),

    );

  }

  @override
  bool get wantKeepAlive => true;

}