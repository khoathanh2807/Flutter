import 'package:flutter/material.dart';

import './app.dart';
import './home_screen.dart';
import '../sakai_services.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final serverController = TextEditingController();

  String loginErrorMessage1 = '';
  String loginErrorMessage2 = '';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Login Screen',

      theme: ThemeData(
        primarySwatch: Colors.teal,
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
          Container(margin: EdgeInsets.only(top: 30.0),),

          serverField(),
          Container(margin: EdgeInsets.only(top: 40.0),),

          loginButton(),
          Container(margin: EdgeInsets.only(top: 30.0),),

          Text(loginErrorMessage1, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          Text(loginErrorMessage2, style: TextStyle(color: Colors.red))

        ],

      ),
    );

  }

  Widget emailField() {

          return TextFormField(

            controller: emailController,
            keyboardType: TextInputType.emailAddress,

            decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Username / Email address',
                hintText: 'Input your Username / Email address',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
            ),

            // onChanged: (value) {
            //   bloc.changeEmail(value);
            // },

            // onSaved: (value) {
            //   emailAddress = value as String;
            // },

          );

  }

  Widget passwordField() {

          return TextFormField(

            controller: passwordController,
            obscureText: true,

            decoration: InputDecoration(
                icon: Icon(Icons.security_rounded),
                labelText: 'Password',
                hintText: 'Input your Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
            ),

            // onChanged: (value) {
            //   bloc.changePassword(value);
            // },

            // onSaved: (value) {
            //   password = value as String;
            // },

          );

  }

  Widget serverField() {

          serverController.text = 'https://xlms.myworkspace.vn';

          return TextFormField(

            controller: serverController,
            keyboardType: TextInputType.url,

            decoration: InputDecoration(
                icon: Icon(Icons.dns),
                labelText: 'Login Server address',
                hintText: 'Input your Login Server address',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
            ),

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

    final formState = formKey.currentState;

    if (!formState!.validate()) {

      return;

    } else {

      final emailAddress = emailController.text;
      final password = passwordController.text;
      final serverAddress = serverController.text;

      print('emailAddress: $emailAddress, password: $password, server: $serverAddress');

      var sakaiService = SakaiService(sakaiUrl: serverAddress);

      sakaiService.authenticate(emailAddress, password).then((response) {

        print('authenticate_response_message: ${response.body}');

        String? token = sakaiService.token;
        print('authenticate_token: $token');

        if (response.statusCode == 200 || response.statusCode == 201) {

          Navigator.of(context).pushReplacementNamed('/');
          // Navigator.pushReplacementNamed(context, '/');
          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

          print('Logged in successfully');

        } else {

          setState(() {
            loginErrorMessage1 = 'Login Failed!';
            loginErrorMessage2 = 'Please check again and enter the valid Username / Email address and Password.';
          });

          print('Login Failed');

        }

      });

    }

  }

}