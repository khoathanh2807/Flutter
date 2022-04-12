import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/image_model.dart';
import '../stream/image_stream.dart' as MyImageStream;

class App extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<StatefulWidget> {

  List<ImageModel> images = [];
  MyImageStream.ImageStream imageStream =  MyImageStream.ImageStream();

  // final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Image App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Demo Stream Image'),),
        // backgroundColor: Colors.blueGrey,
        // body: Text('Số Text đã nhận được: Counter = $counter'),
        body: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Form(
            // key: formKey,
            child: ListView.builder(
              // children: [
              //   Text('Counter = $counter'),
              // ],
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // Prevent null value by using replace value
                  child: Image.network(images[index].url ?? ""),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('Run'),
          onPressed: () {
            changeImage();
          },
        ),
      ),
    );
  }

  changeImage() async {

    imageStream.getImages().listen(
       (eventImage) {
        setState(() {

          print('eventImage: $eventImage');
          images.add(eventImage);

        });
      }
    );

  }

}
