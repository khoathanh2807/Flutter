import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './login_screen.dart';

class InfoScreen extends StatefulWidget {

  @override
  State<InfoScreen> createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> {

  final currentUser = FirebaseAuth.instance.currentUser;

  String userId = '';
  String displayName = '';
  String email = '';
  String photoURL = '';

  @override
  void initState() {
    if (currentUser!.displayName == null) {
      getUserName().then((value) => displayName = value).whenComplete(() {
        setState(() {
        });
      });
      print('displayName = $displayName');
    } else {
      displayName = currentUser!.displayName!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    userId = currentUser!.uid;

    if (currentUser!.email != null) {
      email = currentUser!.email!;
    }

    if (currentUser!.photoURL != null) {
      photoURL = currentUser!.photoURL!;
    }

    return  Scaffold(

      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: const Text('Tài khoản'),
        elevation: 0,
        actions: [
          _logOut()
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [

              // Text('Account Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),
              // SizedBox(height: 40,),

              profilePicture(photoURL),
              const SizedBox(height: 20,),

              Text('Họ tên: $displayName'),
              const SizedBox(height: 20,),

              Text('Email: $email'),
              const SizedBox(height: 20,),

              Text('User ID: $userId'),

            ],
          ),
        ),
      ),

    );

  }

  Future<String> getUserName() async {
    late String _displayName;
    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get().then((value) {
      _displayName = value.get('username').toString();
    });
    return _displayName;
  }

  Widget profilePicture(String photoURL) {

    if (photoURL != '') {
       return Image.network(photoURL, width: 100, height: 100,);
    } else {
       // return Image.asset('assets/images/default-avatar.jpg', width: 100, height: 100,);
       // return Image.network('https://minervastrategies.com/wp-content/uploads/2016/03/default-avatar.jpg');
       return const Image(image: AssetImage('assets/images/default-avatar.jpg'), width: 100, height: 100,);
    }

  }

  Widget _logOut() {

    return IconButton(

      icon: const Icon(Icons.logout),
      tooltip: 'Log Out',
      onPressed: () {
        FirebaseAuth.instance.signOut().then((value) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (_) => false);
          Fluttertoast.showToast(msg: 'User Signed out', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
        });
      },

    );

  }

}
