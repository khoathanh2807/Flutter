import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login_screen.dart';

class PlatformAlert {

  final String? title;
  final String? message;

  const PlatformAlert({@required this.title, @required this.message})
      : assert(title != null),
        assert(message != null);

  void showLogoutAlert(BuildContext context) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      logoutConfirmCupertinoAlert(context);
    } else {
      logoutConfirmMaterialAlert(context);
    }

  }

  void logoutConfirmMaterialAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                TextButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().whenComplete(() {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (_) => false,);
                      Fluttertoast.showToast(msg: 'User Signed out', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue,);
                    });
                  },   // Open Location setting
                ),
              ]
          );
        }
    );
  }

  void logoutConfirmCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                CupertinoButton(
                    child: Text('Cancel', style: TextStyle(color: CupertinoColors.destructiveRed),),
                    onPressed: () => Navigator.of(context).pop(),
                ),
                CupertinoButton(
                  child: Text('OK', style: TextStyle(color: CupertinoColors.activeBlue),),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().whenComplete(() {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (Route<dynamic> route) => false,);
                      Fluttertoast.showToast(msg: 'User Signed out', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue,);
                    });
                  },   // Open Location setting
                ),
              ]
          );
        }
    );
  }

}
