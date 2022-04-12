import 'package:flutter/material.dart';
import '../validation/mixin_validation.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Input Form',
      home: Scaffold(
        appBar: AppBar(title: Text('Demo Input Form')),
        body: LoginScreen(),
      ),

    );

  }

}

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}

class LoginState extends State<StatefulWidget> with ComonValidation {

  final formKey = GlobalKey<FormState>();
  late String emailAddress;
  late String lastname;
  late String firstname;
  late String birthday;
  late String address;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(margin: EdgeInsets.only(top: 40.0),),
              fieldEmailAddress(),
              Container(margin: EdgeInsets.only(top: 20.0),),
              fieldLastname(),
              Container(margin: EdgeInsets.only(top: 20.0),),
              fieldFirstname(),
              Container(margin: EdgeInsets.only(top: 20.0),),
              fieldBirthday(),
              Container(margin: EdgeInsets.only(top: 20.0),),
              fieldAddress(),
              Container(margin: EdgeInsets.only(top: 40.0),),
              inputButton()
            ],
          ),
        )
    );
  }

  Widget fieldEmailAddress() {

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: 'Email address'
      ),
      validator: validateEmail,
      onSaved: (value) {
        emailAddress = value as String;
      },
    );

  }

  Widget fieldLastname() {

    return TextFormField(

      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Lastname'
      ),
      validator: validateLastname,
      onSaved: (value) {
        lastname = value as String;
      },
    );

  }

  Widget fieldFirstname() {

    return TextFormField(

      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Firstname'
      ),
      validator: validateFirstname,
      onSaved: (value) {
        firstname = value as String;
      },
    );

  }

  Widget fieldBirthday() {

    return TextFormField(

      decoration: InputDecoration(
          icon: Icon(Icons.calendar_today),
          labelText: 'Birthday'
      ),
      validator: validateBirthday,
      onSaved: (value) {
        birthday = value as String;
      },
    );

  }

  Widget fieldAddress() {

    return TextFormField(

      decoration: InputDecoration(
          icon: Icon(Icons.location_pin),
          labelText: 'Address'
      ),
      validator: validateAddress,
      onSaved: (value) {
        address = value as String;
      },
    );

  }

  Widget inputButton() {

    return ElevatedButton(
        onPressed: () {

          if(formKey.currentState!.validate()) {
            // Call API Authentication from Backend to Login
            formKey.currentState!.save();
            print('$emailAddress, $lastname');
          };
          // print('Clicked / Touched Login Button');
        },
        child: Text('Input')
    );

  }

}