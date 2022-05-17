import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../shared/firebase_authentication.dart';
import '../validation/mixin_login_validation.dart';
import './login_screen.dart';

class RegisterScreen extends StatefulWidget {

  // const RegisterScreen({Key? key, required this.title}) : super(key: key);
  // final String title;
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen>  with LoginValidation {

  final _formKey = GlobalKey<FormState>();

  late String emailAddress;
  late String password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      // backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,),),

              const SizedBox(height: 60,),

              Form(
                key: _formKey,
                child: Column(
                  children: [

                    // Row(
                    //   children: [
                    //
                    //     Expanded(
                    //       child: TextFormField(
                    //         maxLines: 1,
                    //         decoration: InputDecoration(
                    //           prefixIcon: const Icon(Icons.person),
                    //           hintText: 'First name',
                    //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    //         ),
                    //         validator: (value) {
                    //           if (value!.isEmpty || value == '' || value == null) {
                    //             return 'This cannot be empty.';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //     ),
                    //
                    //     const SizedBox(width: 20,),
                    //
                    //     Expanded(
                    //       child: TextFormField(
                    //         maxLines: 1,
                    //         decoration: InputDecoration(
                    //           prefixIcon: const Icon(Icons.person),
                    //           hintText: 'Last name',
                    //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    //         ),
                    //         validator: (value) {
                    //           if (value!.isEmpty || value == '' || value == null) {
                    //             return 'This cannot be empty.';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //     ),
                    //
                    //   ],
                    // ),

                    const SizedBox(height: 20,),

                    emailField(),       // Email Text Field

                    const SizedBox(height: 20,),

                    passwordField(),    // Password Text Field

                    const SizedBox(height: 20,),

                    confirmPasswordField(),    // Password Text Field

                    const SizedBox(height: 35,),

                    registerButton(),      // Register Confirm Button,

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Text('Already registered?'),

                        TextButton(
                          child: const Text('Sign in', style: TextStyle(fontWeight: FontWeight.bold,),),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);
                          },
                        ),

                      ],
                    ),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );

  }

  Widget emailField() {

    return TextFormField(

      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,

      decoration: InputDecoration(
        // icon: Icon(Icons.person),
        prefixIcon  : const Icon(Icons.email),
        // labelText: 'Email address',
        hintText: 'Enter your email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.white),),
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        // errorText: errorMessage,
      ),

      validator: validateEmail,

      // onSaved: (value) {
      //   emailAddress = value as String;
      // },

    );

  }

  Widget passwordField() {

    return TextFormField(

      controller: passwordController,
      obscureText: true,
      maxLines: 1,

      decoration: InputDecoration(
        // icon: Icon(Icons.security_rounded),
        prefixIcon: const Icon(Icons.lock),
        // labelText: 'Password',
        hintText: 'Enter your password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.white),),
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        // errorText: errorMessage,
      ),

      validator: validatePassword,

      // onSaved: (value) {
      //   password = value as String;
      // },

    );

  }

  Widget confirmPasswordField() {

    return TextFormField(

      // controller: passwordController,
      obscureText: true,
      maxLines: 1,

      decoration: InputDecoration(
        // icon: Icon(Icons.security_rounded),
        prefixIcon: const Icon(Icons.lock),
        // labelText: 'Password',
        hintText: 'Confirm your password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.white),),
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        // errorText: errorMessage,
      ),

      validator: (value) {
          if (value!.isEmpty || value == '' || value == null) {
            return 'Confirm password cannot be empty.';
          } else if (value != passwordController.text) {
            return 'This didn\'t match the password above! Please try again.';
          }
          return null;
      },

      // onSaved: (value) {
      //   password = value as String;
      // },

    );

  }

  Widget registerButton() {

    return ElevatedButton(

      child: const Text('Sign up', style: TextStyle(fontWeight: FontWeight.bold,),),

      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
      ),

      onPressed: () {

        if(_formKey.currentState!.validate()) {

          // _formKey.currentState!.save();

          emailAddress = emailController.text;
          password = passwordController.text;

          auth.createUser(emailAddress, password).then((value) {
            if (value == null) {
              setState(() {
                Fluttertoast.showToast(msg: 'Sign up Failed!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
              });
            } else {
              setState(() {
                Fluttertoast.showToast(msg: 'Signed up Successfully', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
              });
              // changeScreen();
              // Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: emailAddress);
              Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: value);
              print(value.uid);
              print(value.displayName);
              print(value.email);
              print(value.photoURL);
            }
          });

          // Fluttertoast.showToast(msg: 'Sign up successfully, you can Sign in now.', fontSize: 15, timeInSecForIosWeb: 3, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);

          print('emailAddress: $emailAddress, password: $password');

          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);

        }

      },

    );

  }

}