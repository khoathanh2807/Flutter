import 'package:flutter/material.dart';

import '../validation/mixin_validation.dart';
import '../BLoC/bloc_stream.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() {
    return LoginState();
  }

}

class LoginState extends State<LoginScreen> with LoginValidation {

  final formKey = GlobalKey<FormState>();

  // late String emailAddress;
  // late String password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // String errorMessage = '';

  final bloc = Bloc();

  // bloc.streamEmail.listen(
  //   () {
  //
  //   }
  // );

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

                      fieldEmailAddress(),    // Email Text Field
                      const SizedBox(height: 30,),

                      fieldPassword(),        // Password Text Field
                      const SizedBox(height: 40,),

                      loginButton(),          // Login Confirm Button
                      const SizedBox(height: 60,),

                    ],
                  ),
                ),

              ],
            ),
        ),

    );

  }

  Widget fieldEmailAddress() {

    // return TextFormField(
    //   keyboardType: TextInputType.emailAddress,
    //   maxLines: 1,
    //   decoration: InputDecoration(
    //       icon: Icon(Icons.person),
    //       prefixIcon  : const Icon(Icons.email),
    //       labelText: 'Email address',
    //       hintText: 'Input your email address',
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
    //       errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
    //       errorText: errorMessage,
    //   ),
    //   validator: validateEmail,
    //   onSaved: (value) {
    //     emailAddress = value as String;
    //   },
    //   onChanged: (value) {
    //
    //     print('onChanged: email = $value');
    //
    //     // bloc.emailStreamController.sink.add(value);
    //     // bloc.getEmailStreamController().sink.add(value);
    //     bloc.changeEmail(value);
    //
    //     if (!value.contains('@') || !value.contains('.')) {
    //       errorMessage = '$value is an invalid email!';
    //     } else {
    //       errorMessage = '';
    //     }
    //
    //     setState(() {
    //       // update the state of screen
    //     });
    //
    //     print('errorMessage = $errorMessage');
    //
    //   },
    // );

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

  Widget fieldPassword() {

    // return TextFormField(
    //   controller: passwordController,
    //   obscureText: true,
    //   maxLines: 1,
    //   decoration: InputDecoration(
    //       icon: Icon(Icons.security_rounded),
    //       prefixIcon  : const Icon(Icons.email),
    //       labelText: 'Password',
    //       hintText: 'Input your password',
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    //       errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
    //   ),
    //   validator: validatePassword,
    //
    //   onSaved: (value) {
    //       password = value as String;
    //   },
    //
    // );

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

      onPressed: () {

        if(formKey.currentState!.validate()) {

          // Call API Authentication from Backend to Login
          // formKey.currentState!.save();

          final emailAddress = emailController.text;
          final password = passwordController.text;
          print('emailAddress: $emailAddress, password: $password');

          setState(() {
          });

        };
        // print('Clicked / Touched Login Button');
      },

    );

  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

}