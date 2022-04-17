import 'package:flutter/material.dart';

import '../module/Site.dart';

class SiteScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SiteScreenState();

}

class SiteScreenState extends State<SiteScreen> {


  @override
  Widget build(BuildContext context) {
    List<Site> data = ModalRoute
        .of(context)!
        .settings
        .arguments as List<Site>;

    return Scaffold(
      appBar: AppBar(
        title: Text('xLMS client'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.indigo,
                    Colors.indigoAccent,
                    Colors.deepPurpleAccent,
                    Colors.deepPurple
                  ]
              )
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/', arguments: 123);
              },
              icon: Icon(Icons.logout),
            ),),

        ],
      ),
      body: Container(
              child: ListView.builder(
                  itemCount: data.length ,
                  itemBuilder: (BuildContext context, int index) {
                    var itemData = data[index];
                    return ListTile(
                      title: Text(itemData.title),
                      subtitle: Text(
                          "${itemData.Owner }"),
                    );
                  }
              )
        ),
      );

  }
}


