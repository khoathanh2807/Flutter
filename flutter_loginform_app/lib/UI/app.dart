import 'package:flutter/material.dart';
import '../validation/mixin_validation.dart';
import '../bloc/bloc_stream.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Login Form',

      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),

      home: Scaffold(
        appBar: AppBar(title: Text('Demo Login Form')),
        body: LoginScreen(),
      ),

    );

  }

}

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() {
    return LoginState();
  }

}

class LoginState extends State<LoginScreen> with ComonValidation {

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
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: [

            Container(margin: EdgeInsets.only(top: 50.0),),

            fieldEmailAddress(),
            Container(margin: EdgeInsets.only(top: 30.0),),

            fieldpassword(),
            Container(margin: EdgeInsets.only(top: 40.0),),

            loginButton()

          ],
        ),
      )
    );
  }

  Widget fieldEmailAddress() {

    // return TextFormField(
    //   keyboardType: TextInputType.emailAddress,
    //   decoration: InputDecoration(
    //       icon: Icon(Icons.person),
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

  Widget fieldpassword() {

    // return TextFormField(
    //
    //   controller: passwordController,
    //   obscureText: true,
    //
    //   decoration: InputDecoration(
    //       icon: Icon(Icons.security_rounded),
    //       labelText: 'Password',
    //       hintText: 'Input your password',
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    //       errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
    //   ),
    //
    //   validator: validatePassword,
    //
    //   // onSaved: (value) {
    //   //   password = value as String;
    //   // },
    //
    // );

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