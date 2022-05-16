import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {

  // static const route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> userList = <String>['User 1', 'User 2', 'User 3', 'User 4', 'User 5', 'User 6', 'User 7', 'User 8', 'User 9', 'User 10',];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

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

      body: ListView.separated(

        padding: const EdgeInsets.all(8),

        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {

          return GestureDetector(

              onTap: () {
                print("Item $index clicked");
              },

              child: ListTile(

                leading: const CircleAvatar(
                  backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                ),

                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(userList[index], style: const TextStyle(fontWeight: FontWeight.bold),),
                    const Text("Time", style: TextStyle(color: Colors.grey, fontSize: 13.0),),
                  ],
                ),

                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: const Text(
                    "Received Messages",
                    style: TextStyle(color: Colors.grey, fontSize: 13.0),
                  ),
                ),

              )

          );

        },

        separatorBuilder: (BuildContext context, int index) => const Divider(),

      ),

    );

  }

}
