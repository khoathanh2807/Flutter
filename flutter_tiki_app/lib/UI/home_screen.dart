import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        elevation: 0,
        toolbarHeight: 110,

        flexibleSpace: SafeArea(

          child: Padding(

            padding: EdgeInsets.only(top: 0, left: 15, right: 15),

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(

                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Text("   FREESHIP+", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.start,),
                    ),

                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Center(
                          child: Text("TIKI", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
                        )
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          IconButton(
                            onPressed: (){
                            },
                            icon: Icon(Icons.notifications_none_rounded),
                            iconSize: 20,
                            color: Colors.white,
                          ),

                          IconButton(
                            onPressed: (){
                            },
                            icon: Icon(Icons.shopping_cart_outlined),
                            iconSize: 20,
                            color: Colors.white,
                          ),

                        ],
                      ),
                    ),

                  ],

                ),

                SizedBox(height: 10.0,),
                CupertinoSearchTextField(backgroundColor: Colors.white,),

              ],
            ),

          ),

        ),

      ),

    );

  }

}
