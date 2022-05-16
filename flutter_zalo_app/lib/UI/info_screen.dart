import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user.dart';

class InfoScreen extends StatefulWidget {

  @override
  State<InfoScreen> createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> {

  @override
  Widget build(BuildContext context) {

    UserCredentialData userCredentialData = ModalRoute.of(context)!.settings.arguments as UserCredentialData;
    // print('arguments: userCredentialData = $userCredentialData');

    String uid = userCredentialData.uid ?? '';
    String displayName = userCredentialData.displayName ?? 'unknown';
    String email = userCredentialData.email ?? '';
    String photoURL = userCredentialData.photoURL ?? '';

    return  Scaffold(

      // backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: const Text("Account"),
        elevation: 0,
        // backgroundColor: Theme.of(context).colorScheme.background,
        // backgroundColor: Theme.of(context).colorScheme.surface,
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

              Text('Account Name: $displayName'),
              const SizedBox(height: 20,),

              Text('Email: $email'),
              const SizedBox(height: 20,),

              Text('User ID: $uid'),

            ],
          ),
        ),
      ),

    );

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

      icon: Icon(Icons.logout),
      tooltip: 'Log Out',
      onPressed: () {

        Navigator.of(context).pushReplacementNamed('/login');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

        Fluttertoast.showToast(msg: 'User Signed out', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);

      },

    );

  }

}
