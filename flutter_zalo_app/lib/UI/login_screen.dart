import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../validation/mixin_login_validation.dart';
import './register_screen.dart';

class LoginScreen extends StatefulWidget {

  // const LoginScreen({Key? key, required this.title}) : super(key: key);
  // final String title;
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen>  with LoginValidation {

  final _formKey = GlobalKey<FormState>();
  var rememberLogin = false;

  late String emailAddress;
  late String password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // String? errorMessage;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            const Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,),),

            const SizedBox(height: 60,),

            Form(
              key: _formKey,
              child: Column(
                children: [

                  emailField(),       // Email Text Field

                  const SizedBox(height: 20,),

                  passwordField(),    // Password Text Field

                  rememberMeCheckbox(),

                  const SizedBox(height: 20,),

                  loginButton(),      // Login Confirm Button

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text('Not registered yet?'),

                      TextButton(
                        child: const Text('Create an account'),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),),);
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
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        // errorText: errorMessage,
      ),

      validator: validatePassword,

      // onSaved: (value) {
      //   password = value as String;
      // },

    );

  }

  Widget rememberMeCheckbox() {

    return CheckboxListTile(

      title: const Text("Remember me"),

      contentPadding: EdgeInsets.zero,
      activeColor: Theme.of(context).colorScheme.primary,
      controlAffinity: ListTileControlAffinity.leading,

      value: rememberLogin,

      onChanged: (newValue) {
        setState(() {
          rememberLogin = newValue!;
        });
      },

    );

  }

  Widget loginButton() {

    return ElevatedButton(

      child: const Text('Sign in', style: TextStyle(fontWeight: FontWeight.bold,),),

      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
      ),

      onPressed: () {

        if(_formKey.currentState!.validate()) {

          // _formKey.currentState!.save();

          emailAddress = emailController.text;
          password = passwordController.text;

          Fluttertoast.showToast(msg: 'Sign in successfully.', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
          setState(() {
          });

          print('emailAddress: $emailAddress, password: $password');

          // Navigator.pushReplacementNamed(context, '/', arguments: emailAddress);
          // Navigator.of(context).pushReplacementNamed('/', arguments: emailAddress);
          // Navigator.of(context).popAndPushNamed('/', arguments: emailAddress);
          Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: emailAddress);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const MainHome()));
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainHome(),),);

        }

      },

    );

  }

}