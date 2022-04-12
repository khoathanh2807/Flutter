import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {

  static const route = '/contacts';

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();

}

class _ContactsScreenState extends State<ContactsScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        title: const Text("Contacts"),
      ),

      body: Center(
          child: Text("Coming Soon!", style: TextStyle(fontSize: 30),)
      ),

    );

  }

}
