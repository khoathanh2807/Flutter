import 'package:flutter/material.dart';

class DiscoveryScreen extends StatefulWidget {

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();

}

class _DiscoveryScreenState extends State<DiscoveryScreen> {

  static const List<Utilities> utilities_list = <Utilities>[

    Utilities(title: 'Nearby', icon: Icons.location_history, color: Colors.orangeAccent),
    Utilities(title: 'Shop', icon: Icons.shopping_bag, color: Colors.redAccent),
    Utilities(title: 'Sticker', icon: Icons.emoji_emotions, color: Colors.purple),
    Utilities(title: 'eGoverment', icon: Icons.apartment, color: Colors.pinkAccent),
    Utilities(title: 'Fiza', icon: Icons.monetization_on, color: Colors.orange),
    Utilities(title: 'ZaloPay', icon: Icons.account_balance_wallet, color: Colors.white70),
    Utilities(title: 'Mobile Card', icon: Icons.phone_iphone, color: Colors.blueAccent),
    Utilities(title: 'Pay Bills', icon: Icons.receipt, color: Colors.orangeAccent),
    Utilities(title: 'Shop Lazada', icon: Icons.favorite, color: Colors.redAccent),
    Utilities(title: 'Home & Car', icon: Icons.maps_home_work, color: Colors.blueAccent),

  ];

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      resizeToAvoidBottomInset: false,
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
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {

            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff181818),
          padding: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Utilities", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),),
              SizedBox(height: 15,),

              GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  // crossAxisSpacing: 30,
                  children: List.generate(utilities_list.length, (index) {
                    return Center(
                      // child: UtilitiesMenuButton(utilities: utilities_list[index],),
                      child: Center(
                        child: GestureDetector(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white12,
                                child: Icon(utilities_list[index].icon, color: utilities_list[index].color, size: 25,),
                              ),
                              SizedBox(height: 8,),

                              Text(utilities_list[index].title, style: const TextStyle(fontSize: 13)),

                            ],
                          ),
                          onTap: () {
                            print(utilities_list[index].title);
                          },
                        ),
                      ),
                    );
                  })
              ),

            ],
          ),
        ),
      ),

    );

  }

}

class Utilities {

  const Utilities({required this.title, required this.icon, required this.color});

  final String title;
  final IconData icon;
  final Color color;
  // String? url;

}