import 'package:flutter/material.dart';

import './app.dart';
import './home_screen.dart';
import '../BLoC/bloc_login.dart';

class LoginScreen extends StatefulWidget {

  static const route = '/login';

  @override
  State<LoginScreen> createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final bloc = BlocLogin();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Login Screen',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),

      home: Scaffold(

        appBar: AppBar(title: Text('Login'),),

        body: buildLoginForm(),

      ),

    );

  }

  Widget buildLoginForm() {

    return Form(
      key: formKey,
      child: ListView(

        padding: EdgeInsets.only(left: 20, right: 20, top: 50),

        children: [

          emailField(),
          Container(margin: EdgeInsets.only(top: 30.0),),

          passwordField(),
          Container(margin: EdgeInsets.only(top: 40.0),),

          loginButton()

        ],

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

            decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Email address',
                hintText: 'Input your email address',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
                errorText: snapshot.hasError ? snapshot.error as String : null
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

            decoration: InputDecoration(
                icon: Icon(Icons.security_rounded),
                labelText: 'Password',
                hintText: 'Input your password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
                errorText: snapshot.hasError ? snapshot.error as String : null
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

      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
      ),

      child: Text('Login'),

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
      Navigator.of(context).pushReplacementNamed(MainHome.route, arguments: emailAddress);

    }

  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

}