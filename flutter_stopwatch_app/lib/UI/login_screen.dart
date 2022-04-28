import 'package:flutter/material.dart';

import './stopwatch_screen.dart';
import '../validation/mixin_validation.dart';
import '../BLoC/bloc_stream.dart';

class LoginScreen extends StatefulWidget {

  static const route = '/login';

  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> with LoginValidation {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final bloc = Bloc();

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

    return StreamBuilder(

        stream: bloc.streamEmail,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

          return TextFormField(

            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,

            decoration: InputDecoration(
                icon: Icon(Icons.person),
                // prefixIcon  : const Icon(Icons.email),
                labelText: 'Email address',
                hintText: 'Input your email address',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
                errorText: snapshot.hasError ? snapshot.error as String : null,
            ),
            // validator: validateEmail,

            onChanged: (value) {
              bloc.changeEmail(value);
            },

            // onSaved: (value) {
            //   emailAddress = value as String;
            // },

          );

        }

    );

  }

  Widget passwordField() {

    return StreamBuilder(
        stream: bloc.streamPassword,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return TextFormField(

            controller: passwordController,
            obscureText: true,
            maxLines: 1,

            decoration: InputDecoration(
                icon: Icon(Icons.security_rounded),
                // prefixIcon  : const Icon(Icons.lock),
                labelText: 'Password',
                hintText: 'Input your password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
                errorText: snapshot.hasError ? snapshot.error as String : null,
            ),
            // validator: validatePassword,

            onChanged: (value) {
              bloc.changePassword(value);
            },

            // onSaved: (value) {
            //   password = value as String;
            // },

          );
        }
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

    final form = formKey.currentState;

    if (!form!.validate()) {

      return;

    } else {

      final emailAddress = emailController.text;
      final password = passwordController.text;

      print('emailAddress: $emailAddress, password: $password');

      // Navigator.of(context).pushReplacementNamed('/stopwatch', arguments: emailAddress);
      // Navigator.of(context).pushReplacementNamed(StopwatchScreen.route, arguments: emailAddress);
      Navigator.of(context).pushNamedAndRemoveUntil(StopwatchScreen.route, (_) => false, arguments: emailAddress);
      // Navigator.pushReplacementNamed(context, '/stopwatch');

    }

  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

}