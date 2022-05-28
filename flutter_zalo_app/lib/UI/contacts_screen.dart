import 'package:flutter/material.dart';

import './chat_screen.dart';

class ContactsScreen extends StatefulWidget {

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();

}

class _ContactsScreenState extends State<ContactsScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;

  int selectedIndex = 0;

  final screens = [
    FriendsPage(),
    FriendsPage(),
    FriendsPage(),
  ];

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: selectedIndex,
    );
    super.initState();
  }

// class _ContactsScreenState extends State<ContactsScreen> {

  @override
  Widget build(BuildContext context) {

    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    return Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,

        appBar: AppBar(
          // elevation: 0,
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
              Icon(Icons.search, size: 26)
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
              icon: const Icon(Icons.person_add_alt),
              onPressed: () {

              },
            ),
          ],
          bottom: TabBar(
                tabs: const [
                    Center(child: Text('FRIENDS'),),
                    Center(child: Text('GROUPS'),),
                    Center(child: Text('OAS'),),
                ],
                // padding: EdgeInsets.only(top: 10, bottom: 10),
                enableFeedback: false,
                isScrollable: false,
                // indicator: BoxDecoration(
                //   border: Border(
                //     top: BorderSide(style: BorderStyle.solid, color: Colors.grey, width: 1,),
                //     bottom: BorderSide(style: BorderStyle.solid, color: Colors.grey, width: 1,),
                //   ),
                // ),
                // indicator: ShapeDecoration (
                //     shape: UnderlineInputBorder (
                //         borderSide: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid),
                //         borderRadius: BorderRadius.all(Radius.circular(50)),
                //     ),
                // ),
                indicatorColor: Colors.white,
                indicatorWeight: 1,
                // indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.only(top:10, bottom: 10),
                labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                // labelColor: Colors.blue,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                    tabController.animateTo(index);
                  });
                },
          ),
        ),

        // body: TabBarView(
        //     children: [
        //         FriendsPage(),
        //         GroupsPage(),
        //         OasPage(),
        //     ],
        // ),

        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),

      // ),
    );

  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

}

class FriendsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Container(

                color: Color(0xff181818),
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [

                    GestureDetector(
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.people, color: Colors.white, size: 26,),
                            ),
                            SizedBox(width: 20,),
                            Text('Friend request', style: TextStyle(fontSize: 15,),),
                          ],
                        ),
                        onTap: () {
                           print('Friend request');
                        },
                    ),
                    const SizedBox(height: 25,),

                    GestureDetector(
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.green,
                              child: Icon(Icons.contact_page, color: Colors.white, size: 26,),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Phonebook', style: TextStyle(fontSize: 15,),),
                                SizedBox(height: 5,),
                                Text('Contacts who use Zalo', style: TextStyle(fontSize: 14, color: Colors.grey,),),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          print('Phonebook');
                        },
                    ),
                    const SizedBox(height: 8,),

                  ],
                ),

          ),

          const Divider(
            height: 0,
            color: Colors.black,
            thickness: 8,
          ),

          Container(
            color: Color(0xff181818),
            child: Column(
              children:[

                SizedBox(height: 8,),

                Row(
                    children: [

                      // Container(
                      //   decoration: const BoxDecoration(
                      //     color: Colors.grey,
                      //     borderRadius: BorderRadius.all(Radius.circular(50)),
                      //   ),
                      //   child: const Padding(
                      //     padding: EdgeInsets.only(top: 9, bottom: 9, left: 15, right: 15),
                      //     child: Text('All 99', style: TextStyle(color: Colors.black, fontSize: 13,),),
                      //   ),
                      // ),

                      // Container(
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.grey),
                      //     borderRadius: const BorderRadius.all(Radius.circular(50)),
                      //   ),
                      //   child: const Padding(
                      //     padding: EdgeInsets.only(top: 9, bottom: 9, left: 15, right: 15),
                      //     child: Text('Recently online', style: TextStyle(color: Colors.grey, fontSize: 13,),),
                      //   ),
                      // ),

                      SizedBox(width: 20,),

                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey),
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 15)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        child: const Text('All 99', style: TextStyle(color: Colors.black, fontSize: 13,),),
                        onPressed: () {
                        },
                      ),
                      const SizedBox(width: 10,),

                      OutlinedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 15)),
                          side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.grey, width: 1.0, style: BorderStyle.solid,),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        // style: OutlinedButton.styleFrom(
                        //   padding: const EdgeInsets.only(top: 9, bottom: 9, left: 15, right: 15,),
                        //   side: const BorderSide(color: Colors.grey, width: 1.0, style: BorderStyle.solid,),
                        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
                        // ),
                        child: const Text('Recently online', style: TextStyle(color: Colors.grey, fontSize: 13,),),
                        onPressed: () {
                        },
                      ),

                    ],
                ),

                const Divider(
                  color: Colors.grey,
                  thickness: 0.1,
                ),

                // Expanded(
                //     child: contactList(context),
                // ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //
                //           Row(
                //             children: const [
                //               CircleAvatar(
                //                 radius: 22.0,
                //                 backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
                //               ),
                //               SizedBox(width: 20,),
                //               Text(
                //                 'Zalo User',
                //                 // maxLines: 1,
                //                 // overflow: TextOverflow.ellipsis,
                //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
                //               ),
                //             ],
                //           ),
                //
                //           Row(
                //               children: const [
                //                   Icon(Icons.call_outlined),
                //                   SizedBox(width: 25,),
                //                   Icon(Icons.videocam_outlined),
                //               ],
                //           ),
                //
                //         ],
                //       ),
                //     ],
                //   ),
                // ),

                contactList(context),
                SizedBox(height: 16),

              ],
            ),
          ),

          const Divider(
            height: 0,
            color: Colors.black,
            thickness: 8,
          ),

        ],
      ),
    );
  }

  Widget contactList(BuildContext context){

    return ListView.separated(

      padding: const EdgeInsets.only(left: 25, right: 25),
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,   // make ListView to use a little space as possible
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {

        var recipientName = 'Zalo User ${index + 1}';

        return ListTile(
          
          contentPadding: EdgeInsets.only(top: 6, bottom: 6),

          leading: const CircleAvatar(
            radius: 22.0,
            backgroundImage: NetworkImage('http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'),
          ),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                recipientName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [

                  // Icon(Icons.call_outlined,),
                  // SizedBox(width: 25,),
                  // Icon(Icons.videocam_outlined, size: 29,),

                  IconButton(
                    icon: Icon(Icons.call_outlined,),
                    onPressed: () {
                    },
                  ),
                  SizedBox(width: 5,),

                  IconButton(
                    icon: Icon(Icons.videocam_outlined, size: 29,),
                    onPressed: ( ){
                    },
                  ),

                ],
              ),
            ],
          ),

          onTap: () {
            print(recipientName);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(recipient: recipientName)));
          },

        );

      },

      separatorBuilder: (BuildContext context, int index) => const Divider(),

    );

  }

}

class GroupsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("GROUPS", style: TextStyle(fontSize: 30),),
    );
  }

}

class OasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("OAS", style: TextStyle(fontSize: 30),),
    );
  }

}