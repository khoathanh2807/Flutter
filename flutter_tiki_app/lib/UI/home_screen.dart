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

        toolbarHeight: 100,

        flexibleSpace: ListView(

          padding: EdgeInsets.only(top: 40, left: 20, right: 20),

          children: [

            Row(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text("FREESHIP+", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                SizedBox(width: 45,),

                Text("TIKI", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),),
                SizedBox(width: 45,),

                IconButton(
                  onPressed: (){
                  },
                  icon: Icon(Icons.notifications_none_rounded),
                  iconSize: 25,
                  color: Colors.white,
                ),

                IconButton(
                  onPressed: (){
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                  iconSize: 25,
                  color: Colors.white,
                ),

              ],

            ),

            Container(padding: EdgeInsets.only(top: 10.0),),
            CupertinoSearchTextField(
              backgroundColor: Colors.white,
            ),

          ],

        ),

      ),

    );

  }

}
