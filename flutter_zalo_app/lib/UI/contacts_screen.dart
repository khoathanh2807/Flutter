import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ContactsScreen extends StatefulWidget {

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();

}

class _ContactsScreenState extends State<ContactsScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      // backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Theme.of(context).colorScheme.background,
        backgroundColor: Theme.of(context).colorScheme.surface,
        flexibleSpace: const SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  brightness: Brightness.dark,
                ),
                child: CupertinoSearchTextField(),
              ),
            ),
          ),
        ),
      ),

      body: Center(
          child: Text("Coming Soon!", style: TextStyle(fontSize: 30),)
      ),

    );

  }

}
