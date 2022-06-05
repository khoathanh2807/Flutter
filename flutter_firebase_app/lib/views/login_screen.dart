import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/firebase_authentication.dart';
import '../validation/mixin_login_validation.dart';
// import '../data_provider.dart';
// import './app.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }

}

class _LoginScreenState extends State<StatefulWidget> with LoginValidation {

  final _formKey = GlobalKey<FormState>();

  late String emailAddress;
  late String password;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLogin = true;
  String _message = '';

  late FirebaseAuthentication auth;
  // late FirebaseAuthentication auth = DataProvider.of(context);

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
    String titleText = _isLogin ? 'Sign In' : 'Sign Up';
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: Text('Sign in'),
        //   actions: [
        //     IconButton(
        //       icon: const Icon(Icons.logout),
        //       onPressed: () {
        //         auth.logout().then((value) {
        //           if (value) {
        //             setState(() {
        //               _message = 'User Signed out';
        //             });
        //           } else {
        //             setState(() {
        //               _message = 'Unable to Sign out';
        //             });
        //           }
        //         });
        //       },
        //     )
        //   ],
        // ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(titleText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40,),),
                const SizedBox(height: 60,),

                Form(
                    key: _formKey,
                    child: Column(
                        children: [

                            emailInputField(),
                            const SizedBox(height: 20,),

                            passwordInputField(),
                            const SizedBox(height: 40,),

                            mainButton(),
                            const SizedBox(height: 10,),

                            secondaryButton(),
                            const SizedBox(height: 50,),

                            loginGoogleButton(),
                            const SizedBox(height: 20,),

                            txtMessage(),

                        ],
                    ),
                ),

              ],
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.logout),
          onPressed: () {
            auth.logout().then((value) {
              if (value) {
                setState(() {
                  _message = 'User Signed out';
                  Fluttertoast.showToast(msg: 'User Signed out', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
                });
              } else {
                setState(() {
                  _message = 'Unable to Sign out!';
                  Fluttertoast.showToast(msg: 'Unable to Sign out!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
                });
              }
            });
          },
        ),

    );
  }

  Widget emailInputField() {
    return TextFormField(

          controller: emailController,
          keyboardType: TextInputType.emailAddress,

          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              hintText: 'Enter your email',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),

          validator: validateEmail,

    );
  }

  Widget passwordInputField() {
    return TextFormField(

          controller: passwordController,
          obscureText: true,

          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              hintText: 'Enter your password',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),

          validator: validatePassword,

    );
  }

  Widget mainButton() {
      String btnMainText = _isLogin ? 'Sign in' : 'Sign up';
      return ElevatedButton(

          // child: Text(btnText, style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark,),),
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight),
          //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //     RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(15.0),
          //       // side: BorderSide(color: Colors.red),
          //     ),
          //   ),
          // ),

          child: Text(btnMainText, style: const TextStyle(fontWeight: FontWeight.bold,),),

          style: ElevatedButton.styleFrom(
            // elevation: 0,
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
          ),

          onPressed: () {
            if(_formKey.currentState!.validate()) {

              emailAddress = emailController.text;
              password = passwordController.text;

              String userId = '';

              if (_isLogin) {   // đăng nhập Firebase bằng email và password

                auth.login(emailAddress, password).then((value) {
                  if (value == null) {
                    setState(() {
                      _message = 'Sign in Error!';
                      Fluttertoast.showToast(msg: 'Sign in Failed!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
                    });
                  } else {
                    userId = value;
                    setState(() {
                      _message = 'User successfully Signed in \n\n $userId';
                      Fluttertoast.showToast(msg: 'Signed in Successfully', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
                    });
                    // changeScreen();
                    // Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: emailAddress);
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: value);
                  }
                });

              } else {    // đăng ký Firebase bằng email và password

                auth.createUser(emailAddress, password).then((value) {
                  if (value == null) {
                    setState(() {
                      _message = 'Registration Error!';
                      Fluttertoast.showToast(msg: 'Sign up Failed!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
                    });
                  } else {
                    userId = value;
                    setState(() {
                      _message = 'User successfully Signed in \n\n $userId';
                      Fluttertoast.showToast(msg: 'Signed up Successfully', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
                    });
                    // changeScreen();
                    // Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: emailAddress);
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: value);
                  }
                });

              }

            }
          },

      );
  }

  Widget secondaryButton() {
    String btnSecondaryText = _isLogin ? 'Sign up' : 'Sign in';
    return TextButton(

      child: Text(btnSecondaryText, style: const TextStyle(fontWeight: FontWeight.bold,),),

      onPressed: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },

    );
  }

  Widget loginGoogleButton() {
    return ElevatedButton(

              // child: Text('Log in with Google', style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(FontAwesomeIcons.google, color: Colors.black87, size: 22,),
                  SizedBox(width: 10,),
                  Text('Sign in with Google', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),),
                ],
              ),

              style: ButtonStyle(
                // elevation: MaterialStateProperty.all(0),
                // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(const EdgeInsets.only(top: 16, bottom: 16,)),
                // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30, color: Colors.black),)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(color: Colors.black26),
                  ),
                ),
              ),

              onPressed: () {   // đăng nhập Firebase bằng account Google
                auth.loginWithGoogle().then((value) {
                  if (value == null) {
                    setState(() {
                      _message = 'Google Sign in Error!';
                      Fluttertoast.showToast(msg: 'Sign in with Google Failed!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
                    });
                  } else {
                    setState(() {
                      _message = 'User successfully Signed in with Google \n\n $value';
                      Fluttertoast.showToast(msg: 'Signed in with Google Successfully', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
                    });
                    // changeScreen();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: value);
                  }
                });
              },

    );
  }

  Widget txtMessage() {
    return Text(_message, style: TextStyle(color: Theme.of(context).primaryColorDark,),);
  }

  // void changeScreen() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => MainHome()));
  // }

}
