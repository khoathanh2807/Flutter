import 'package:flutter/material.dart';

import './login_screen.dart';

class InfoScreen extends StatefulWidget {

  static const route = '/info';

  @override
  State<InfoScreen> createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        title: const Text("Me"),
        actions: [
          _logOut()
        ],
      ),

      body: Center(
          child: Text("Coming Soon!", style: TextStyle(fontSize: 30),)
      ),

    );

  }

  Widget _logOut() {

    return IconButton(

      icon: Icon(Icons.logout),
      tooltip: 'Log Out',
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed(LoginScreen.route);
        Navigator.pushReplacementNamed(context, LoginScreen.route);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },

    );

  }

}
