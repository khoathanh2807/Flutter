import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<StatefulWidget> {

  final storage = FlutterSecureStorage();
  final myKey = 'myPass';
  var textController = TextEditingController();
  String? reloadedText;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('Flutter Secure Storage Demo App'),),

      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [

            TextField(
              controller: textController,
              onEditingComplete: () {
                setState(() {});
              },
            ),
            Container(margin: EdgeInsets.only(top: 30.0),),

            Text('Input Text: ${textController.text}'),
            Container(margin: EdgeInsets.only(top: 30.0),),

            ElevatedButton(
                onPressed: () {
                  writeToSecureStorage(textController.text);
                },
                child: Text('SAVE')
            ),
            Container(margin: EdgeInsets.only(top: 15.0),),

            ElevatedButton(
                onPressed: () async {
                  reloadedText = await readFromSecureStorage();
                  setState(() {});
                },
                child: Text('LOAD')
            ),
            Container(margin: EdgeInsets.only(top: 30.0),),

            Text('Reloaed Text: ${reloadedText}'),

          ],
        ),
      ),

    );

  }

  Future writeToSecureStorage(text) async {
    await storage.write(key: myKey, value: text);
  }

  Future<String?> readFromSecureStorage() async {
    String? secret = await storage.read(key: myKey);
    return secret;
  }

}