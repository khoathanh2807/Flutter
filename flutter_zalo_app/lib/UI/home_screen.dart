import 'package:flutter/material.dart';

import './chat_screen.dart';

class HomeScreen extends StatefulWidget {

  // static const route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: Colors.black,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff252525),
        // flexibleSpace: const SafeArea(
        //   child: Center(
        //     child: Padding(
        //       padding: EdgeInsets.only(left: 20, right: 20),
        //       child: CupertinoTheme(
        //         data: CupertinoThemeData(
        //           brightness: Brightness.dark,
        //         ),
        //         child: CupertinoSearchTextField(),
        //       ),
        //     ),
        //   ),
        // ),
        leading: Row(
          children: const [
            SizedBox(width: 25,),
            Icon(Icons.search, size: 26),
          ],
        ),
        title: const TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 19),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {

            },
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 26),
            onPressed: () {

            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff181818),
          padding: const EdgeInsets.all(8),
          child: ListView.separated(

            physics: NeverScrollableScrollPhysics(),
            primary: true,
            shrinkWrap: true,

            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {

              var recipientName = 'Zalo User ${index + 1}';

              return ListTile(

                    leading: const CircleAvatar(
                      radius: 22.0,
                      backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                    ),

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          recipientName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("22/05", style: TextStyle(color: Colors.grey, fontSize: 13.0),),
                      ],
                    ),

                    subtitle: Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Text(
                        "Received Messages",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 13.0),
                      ),
                    ),

                    onTap: () {
                      print(recipientName);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChatScreen(receiver: receiver)));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(recipientName: recipientName)));
                    },

              );

            },

            separatorBuilder: (BuildContext context, int index) => const Divider(),

          ),
        ),
      ),

    );

  }

}
