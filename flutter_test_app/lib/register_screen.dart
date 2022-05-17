import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import './login_screen.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
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

                  Row(
                    children: [

                      Expanded(
                        child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'First name',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                          ),
                          validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                        ),
                      ),

                      const SizedBox(width: 20,),

                      Expanded(
                        child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Last name',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                          ),
                          validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 20,),

                  TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
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

                  const SizedBox(height: 20,),

                  ElevatedButton(
                    child: const Text('Sign up', style: TextStyle(fontWeight: FontWeight.bold,),),
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
                      const Text('Already registered?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(title: 'Login UI'),),);
                        },
                        child: const Text('Sign in'),
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
