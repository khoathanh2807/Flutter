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
  String documentsPath = '';
  String tempPath = '';

  late File myFile;
  String fileText = '';

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

      appBar: AppBar(title: Text('Setting'),),

      body: Container(
        padding: EdgeInsets.all(20),
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

    // câu lệnh lấy ra đường dẫn tới thư mục 'Documents' của app này
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    final tempDirectory = await getTemporaryDirectory();

    setState(() {
      documentsPath = appDocumentsDirectory.path;
      tempPath = tempDirectory.path;
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
        // lưu dữ liệu đã đọc được từ file 'myFile' vào biến 'fileText'
        fileText = fileContent;
      });

      return true;

    } catch (e) {
      // On error, return false.
      return false;
    }

  }

}