import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/image_model.dart';

class ImageStream {

  List<ImageModel> images = [];

  fetchImage() async {

    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    http.get(url).then(
      (result) {
        var jsonArray = json.decode(result.body);
        images = List<ImageModel>.from(
            jsonArray.map(
                (jsonObj) => ImageModel.fromJson(jsonObj)
            )
        );
      }
    );

    // setState(() {
    //   //Do nothing
    // });

  }

  // ImageStream() {
  //   fetchImage();
  // }

  Stream<ImageModel> getImages() async* {

    fetchImage();
    print('Length of images = ${images.length}');

    yield* Stream.periodic(Duration(seconds: 5), (int t) {

      print('t = $t');

      // ImageModel generatedImage = new ImageModel(123, 'example');
      late ImageModel generatedImage;

      if(images.isNotEmpty){
        generatedImage = images[t];
      }

      return generatedImage;

    });

  }

}
