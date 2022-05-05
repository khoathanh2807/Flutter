import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../shared/firebase_authentication.dart';
import './poll.dart';
import './happy_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<StatefulWidget> {

  final TextEditingController txtUserName = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  bool _isLogin = true;
  String _message = '';

  late FirebaseAuthentication auth;

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      auth = FirebaseAuthentication();
      setState(() {
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign in'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                auth.logout().then((value) {
                  if (value) {
                    setState(() {
                      _message = 'User Signed out';
                    });
                  } else {
                    setState(() {
                      _message = 'Unable to Sign out';
                    });
                  }
                });
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(36),
          child: ListView(
            children: [
              userInput(),
              passwordInput(),
              btnMain(),
              SizedBox(height: 10,),
              btnSecondary(),
              btnGoogle(),
              txtMessage(),
            ],
          ),
        ),
    );
  }

  Widget userInput() {
    return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: TextFormField(
          controller: txtUserName,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              icon: Icon(Icons.verified_user),
              hintText: 'Username',
          ),
          validator: (text) => text!.isEmpty ? 'Username is required' : '',
        )
    );
  }

  Widget passwordInput() {
    return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: TextFormField(
          controller: txtPassword,
          // keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: const InputDecoration(
              icon: Icon(Icons.enhanced_encryption),
              hintText: 'Password',
          ),
          validator: (text) => text!.isEmpty ? 'Password is required' : '',
        )
    );
  }

  Widget btnMain() {
    String btnText = _isLogin ? 'Sign in' : 'Sign up';
    return Padding(
        padding: EdgeInsets.only(top: 60),
        child: Container(
            height: 60,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        // side: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                child: Text(btnText, style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark,),),
                onPressed: () {
                  String userId = '';
                  if (_isLogin) {
                      auth.login(txtUserName.text, txtPassword.text).then((value) {
                          if (value == null) {
                              setState(() {
                                _message = 'Sign in Error!';
                              });
                          } else {
                              userId = value;
                              setState(() {
                                _message = 'User successfully Signed in \n\n $userId';
                              });
                              changeScreen();
                          }
                      });
                  } else {
                    auth.createUser(txtUserName.text, txtPassword.text).then((value) {
                      if (value == null) {
                        setState(() {
                          _message = 'Registration Error!';
                        });
                      } else {
                        userId = value;
                        setState(() {
                          _message = 'User successfully Signed in \n\n $userId';
                        });
                        changeScreen();
                      }
                    });
                  }
                }
            ),
        ),
    );
  }

  Widget btnSecondary() {
    String buttonText = _isLogin ? 'Sign up' : 'Sign in';
    return TextButton(
      child: Text(buttonText, style: const TextStyle(fontSize: 15,),),
      onPressed: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },
    );
  }

  Widget btnGoogle() {
    return Padding(
        padding: EdgeInsets.only(top: 120),
        child: Container(
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30, color: Colors.black),)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.black38),
                  ),
                ),
              ),
              // child: Text('Log in with Google', style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark),),
              child: const Text('Sign in with Google', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87),),
              onPressed: () {
                auth.loginWithGoogle().then((value) {
                  if (value == null) {
                    setState(() {
                      _message = 'Google Sign in Error!';
                    });
                  } else {
                    setState(() {
                      _message = 'User successfully Signed in with Google \n\n $value';
                    });
                    changeScreen();
                  }
                });
              },
            ),
        ),
    );
  }

  Widget txtMessage() {
    return Text(
      _message,
      style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).primaryColorDark,
          // fontWeight: FontWeight.bold,
      ),
    );
  }

  void changeScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PollScreen()));
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HappyScreen()));
  }

}
