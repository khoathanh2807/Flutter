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
    GroupsPage(),
  ];

  @override
  void initState() {
    tabController = TabController(
      length: 2,
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

                controller: tabController,

                tabs: const [
                    Center(child: Text('FRIENDS'),),
                    Center(child: Text('GROUPS'),),
                ],

                // padding: EdgeInsets.only(top: 10, bottom: 10),
                enableFeedback: false,
                isScrollable: false,

                // indicator: BoxDecoration(
                //   border: Border(
                //     top: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid,),
                //     bottom: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid,),
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

                labelPadding: EdgeInsets.only(top: 10, bottom: 10),
                labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                // labelColor: Colors.blue,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                unselectedLabelColor: Colors.grey,

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
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 28,),

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
            padding: EdgeInsets.only(top: 8, bottom: 16, left: 20, right: 20,),
            child: Column(
              children:[

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
                      //     border: Border.all(width: 1, color: Colors.grey, style: BorderStyle.solid,),
                      //     borderRadius: const BorderRadius.all(Radius.circular(50)),
                      //   ),
                      //   child: const Padding(
                      //     padding: EdgeInsets.only(top: 9, bottom: 9, left: 15, right: 15),
                      //     child: Text('Recently online', style: TextStyle(color: Colors.grey, fontSize: 13,),),
                      //   ),
                      // ),

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
                        child: const Text('All (99)', style: TextStyle(color: Colors.black, fontSize: 13,),),
                        onPressed: () {
                        },
                      ),
                      const SizedBox(width: 10,),

                      OutlinedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 15)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.grey, width: 1.0, style: BorderStyle.solid,),
                          ),
                        ),
                        // style: OutlinedButton.styleFrom(
                        //   padding: const EdgeInsets.only(top: 9, bottom: 9, left: 15, right: 15,),
                        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
                        //   side: const BorderSide(color: Colors.grey, width: 1.0, style: BorderStyle.solid,),
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

  Widget contactList(BuildContext context) {

    return ListView.separated(

      padding: const EdgeInsets.only(left: 8, right: 8),

      shrinkWrap: true,   // make ListView to use a little space as possible
      primary: false,
      physics: const NeverScrollableScrollPhysics(),

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
                    onPressed: () {
                    },
                  ),

                ],
              ),
            ],
          ),

          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen(recipientName: recipientName)));
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
    return SingleChildScrollView(
      child: Column(
        children: [

          Container(

              color: Color(0xff181818),
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 25,),

              child: GestureDetector(
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white12,
                        child: Icon(Icons.groups_outlined, color: Colors.blue, size: 26,),
                      ),
                      SizedBox(width: 20,),
                      Text('Create New Group', style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  onTap: () {
                    print('Create New Group');
                  },
              ),

          ),

          const Divider(
            height: 0,
            color: Colors.black,
            thickness: 8,
          ),

          Container(
            color: Color(0xff181818),
            padding: EdgeInsets.only(top: 14, bottom: 16, left: 20, right: 20,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('Joined Groups (15)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                SizedBox(height: 10,),

                const Divider(
                  color: Colors.grey,
                  thickness: 0.1,
                ),

                ListView.separated(

                  padding: const EdgeInsets.only(left: 8, right: 8),

                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {

                    var recipientName = 'Zalo Chat Group ${index + 1}';

                    return ListTile(

                      contentPadding: EdgeInsets.all(0),

                      leading: const CircleAvatar(
                        radius: 22.0,
                        backgroundImage: NetworkImage('https://thumbs.dreamstime.com/b/people-talking-icon-group-message-black-isolated-white-background-eps-vector-181421234.jpg'),
                      ),

                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            recipientName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold,),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen(recipientName: recipientName)));
                      },

                    );

                  },

                  separatorBuilder: (BuildContext context, int index) => const Divider(),

                ),

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

}