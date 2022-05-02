import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import './register_screen.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  var rememberLogin = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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

                  TextFormField(

                    maxLines: 1,

                    decoration: InputDecoration(
                      prefixIcon  : const Icon(Icons.email),
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    ),

                    validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",

                  ),

                  const SizedBox(height: 20,),

                  TextFormField(

                    obscureText: true,
                    maxLines: 1,

                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },

                  ),

                  CheckboxListTile(

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

                  ),

                  const SizedBox(height: 20,),

                  ElevatedButton(

                    child: const Text('Sign in', style: TextStyle(fontWeight: FontWeight.bold,),),

                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },

                  ),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text('Not registered yet?'),

                      TextButton(
                        child: const Text('Create an account'),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage(title: 'Register UI'),),);
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

}
