import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {

  const SettingScreen({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _SettingScreenState();
  }

}

class _SettingScreenState extends State<StatefulWidget> {

  int appCounter = 0;

  String documentsPath='';
  String tempPath='';

  late File myFile;
  String fileText='';

  @override
  void initState() {
    readAndWritePreference();
    getPaths().then((_) {
      myFile = File('$documentsPath/pizzas.txt');
      writeFile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      body: Container(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('The app has been opened $appCounter times.'),
            Text('Document path: $documentsPath'),
            Text('Temp path: $tempPath'),
            ElevatedButton(
              child: Text('Read File'),
              onPressed: () => readFile(),
            ),
            Text(fileText),
          ],
        ),
      )
    );
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;

    await prefs.setInt('appCounter', appCounter);
    setState(() {
    });
  }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
          return true;
      } catch (e) {
        return false;
      }
  }

  Future<bool> readFile() async {
    try {
      // Read the file.
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      // On error, return false.
      return false;
    }
  }

}