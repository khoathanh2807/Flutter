import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import '../shared/firebase_authentication.dart';

class InfoScreen extends StatefulWidget {

  @override
  State<InfoScreen> createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> {

  // FirebaseAuthentication auth = FirebaseAuthentication();

  @override
  Widget build(BuildContext context) {

    String inputArgument = ModalRoute.of(context)!.settings.arguments as String;
    print('arguments: inputArgument = $inputArgument');

    return  Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: const Text('Firebase Authentication'),
        actions: [
          _logOut()
        ],
      ),

      body: Center(

          child: Container(
              padding: const EdgeInsets.all(30),
              child: Text(inputArgument, style: const TextStyle(fontSize: 17),)
          ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.logout),
      //   onPressed: () {
      //     Navigator.of(context).pushReplacementNamed('/login');
      //   },
      // ),

    );

  }

  Widget _logOut() {

    return IconButton(

      icon: Icon(Icons.logout),
      tooltip: 'Log Out',
      onPressed: () {

        // auth.logout().then((value) {
        //   if (value) {
        //     setState(() {
        //       Fluttertoast.showToast(msg: 'User Signed out', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
        //     });
        //     Navigator.of(context).pushReplacementNamed('/login');
        //   } else {
        //     setState(() {
        //       Fluttertoast.showToast(msg: 'Unable to Sign out!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
        //     });
        //   }
        // });

        Navigator.of(context).pushReplacementNamed('/login');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        Fluttertoast.showToast(msg: 'User Signed out', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);

      },

    );

  }

}
