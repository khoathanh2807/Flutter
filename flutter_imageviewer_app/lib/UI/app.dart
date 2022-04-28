import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/image_model.dart';

class App extends StatefulWidget {

  @override
  State<App> createState() {
    return AppState();
  }

}

class AppState extends State<App> {

  int counter = 0;
  List<ImageModel> images = [];

  fetchImage() async {

    counter++;

    var url = Uri.https('jsonplaceholder.typicode.com', 'photos/$counter');
    var response= await http.get(url);
    print(response.body);
    var jsonObject = json.decode(response.body);

    var imageModel = ImageModel(jsonObject['id'], jsonObject['url']);
    images.add(imageModel);

    print('counter = $counter');

    print('Length of images = ${images.length}');

    setState(() {
      //Do nothing
    });

  }

  @override
  Widget build(BuildContext context) {

    var appWidget = MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Viewer App - v0.0.6'),
        ),
        body: ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {

              // return Text('${images[index].url}');
              // return Image.network(images[index].url);

              return Container(
                padding: const EdgeInsets.all(10),
                child: Image.network(images[index].url),
              );

            }
        ),
        floatingActionButton: FloatingActionButton(

          child: Icon(Icons.add),
          onPressed: fetchImage,

        ),
      ),
    );

    return appWidget;

  }

}