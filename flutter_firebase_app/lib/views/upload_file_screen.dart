import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadFileScreen extends StatefulWidget {

  // @override
  // State<StatefulWidget> createState()  => _UploadFileScreenState();

  @override
  _UploadFileScreenState createState() => _UploadFileScreenState();

}

class _UploadFileScreenState extends State<UploadFileScreen> {

  File? _image;
  String _message = '';
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            elevation: 0,
            title: const Text('Firebase Storage'),
        ),

        body: Center(
            // padding: const EdgeInsets.all(30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ElevatedButton(
                      child: const Text('Choose Image from Your Library'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
                      ),
                      onPressed: () {
                        getImage();
                      },
                  ),
                  SizedBox(height: 50,),

                  (_image == null)
                      ? Container(
                          height: 200, width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26, width: 1),
                          ),
                          child: const Center(
                            child: Text('No Image'),
                          ),
                      )
                      : Container(
                          height: 200,
                          child: Image.file(_image!),
                      ),
                  SizedBox(height: 50,),

                  ElevatedButton(
                      child: const Text('Upload to Firebase Storage'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
                      ),
                      onPressed: () {
                        uploadImage();
                      },
                  ),
                  SizedBox(height: 50,),

                  Text(_message),

                ],
            ),
        ),

    );
  }

  Future getImage() async {

    final imagePicker = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (imagePicker != null) {
        _image = File(imagePicker.path);
      } else {
        print('No image selected.');
        Fluttertoast.showToast(msg: 'No image selected!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
      }
    });

  }

  Future uploadImage() async {

    if (_image != null) {

      FirebaseStorage storage = FirebaseStorage.instance;

      String fileName = basename(_image!.path);
      Reference storageReference = storage.ref(fileName);

      setState(() {
        _message = 'Uploading file. Please wait...';
      });

      storageReference.putFile(_image!).then((TaskSnapshot result) {
        if (result.state == TaskState.success) {
          setState(() {
            _message = 'File Uploaded Successfully';
            Fluttertoast.showToast(msg: 'File Uploaded Successfully', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
          });
        } else {
          setState(() {
            _message = 'Error Uploading File!';
            Fluttertoast.showToast(msg: 'Error Uploading File!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
          });
        }
      });

    } else {
      Fluttertoast.showToast(msg: 'No image selected!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
    }

  }

}