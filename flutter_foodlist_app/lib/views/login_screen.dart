import 'package:flutter/material.dart';

import '../validators/mixin_login_validator.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen>  with LoginValidator {

  final formKey = GlobalKey<FormState>();

  late String emailAddress;
  late String password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            const Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,),),
            const SizedBox(height: 60,),

            Form(
              key: formKey,
              child: Column(
                children: [

                  emailField(),       // Email Text Field
                  const SizedBox(height: 30,),

                  passwordField(),    // Password Text Field
                  const SizedBox(height: 40,),

                  loginButton(),      // Login Confirm Button
                  const SizedBox(height: 60,),

                ],
              ),
            )

          ],
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
        labelText: 'Email address',
        hintText: 'Input your email address',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        errorText: errorMessage,
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
        labelText: 'Password',
        hintText: 'Input your password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        errorText: errorMessage,
      ),

      validator: validatePassword,

      // onSaved: (value) {
      //   password = value as String;
      // },

    );

  }

  Widget loginButton() {

    return ElevatedButton(

        child: const Text('Sign in', style: TextStyle(fontWeight: FontWeight.bold,),),

        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
        ),

        onPressed: validate,

    );

  }

  void validate() {

    if(formKey.currentState!.validate()) {

      // _formKey.currentState!.save();

      emailAddress = emailController.text;
      password = passwordController.text;

      setState(() {
      });

      print('emailAddress: $emailAddress, password: $password');

      // Navigator.of(context).pushReplacementNamed('/', arguments: emailAddress);
      Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: emailAddress);
      // Navigator.pushReplacementNamed(context, '/');
      // Navigator.push(context, MaterialPageRoute(builder: (context) => MainHome()));

    }

  }

}