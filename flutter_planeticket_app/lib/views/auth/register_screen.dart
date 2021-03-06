import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../controllers/validation/mixin_login_validation.dart';
import '../../controllers/authentication/firebase_authentication.dart';
import '../app.dart';
import './login_screen.dart';

class RegisterScreen extends StatefulWidget {

  // const RegisterScreen({Key? key, required this.title}) : super(key: key);
  // final String title;
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> with LoginValidation {

  final _formKey = GlobalKey<FormState>();
  var showPassword = false;

  late String emailAddress;
  late String username;
  late String password;

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  late FirebaseAuthentication auth;

  @override
  void initState() {
    // Firebase.initializeApp().whenComplete(() {
      auth = FirebaseAuthentication();
      setState(() {
      });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
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

                    // Row(
                    //   children: [

                    //     Expanded(
                    //       child: TextFormField(
                    //         maxLines: 1,
                    //         decoration: InputDecoration(
                    //           prefixIcon: const Icon(Icons.person),
                    //           hintText: 'First name',
                    //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    //         ),
                    //         validator: (value) {
                    //           if (value!.isEmpty || value == '' || value == null) {
                    //             return 'This cannot be empty.';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //     ),

                    //     const SizedBox(width: 20,),

                    //     Expanded(
                    //       child: TextFormField(
                    //         maxLines: 1,
                    //         decoration: InputDecoration(
                    //           prefixIcon: const Icon(Icons.person),
                    //           hintText: 'Last name',
                    //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    //         ),
                    //         validator: (value) {
                    //           if (value!.isEmpty || value == '' || value == null) {
                    //             return 'This cannot be empty.';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //     ),

                    //   ],
                    // ),

                    // const SizedBox(height: 20,),

                    emailField(),       // Email Text Field

                    const SizedBox(height: 20,),

                    usernameField(),       // Username Text Field

                    const SizedBox(height: 20,),

                    passwordField(),    // Password Text Field

                    const SizedBox(height: 20,),

                    confirmPasswordField(),    // Password Text Field

                    showPasswordCheckbox(),

                    const SizedBox(height: 20,),

                    registerButton(),      // Register Confirm Button,

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Text('Already registered?'),

                        TextButton(
                          child: const Text('Sign in', style: TextStyle(fontWeight: FontWeight.bold,),),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);
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

  Widget usernameField() {

    return TextFormField(

      controller: usernameController,
      maxLines: 1,

      decoration: InputDecoration(
        // icon: Icon(Icons.person),
        prefixIcon  : const Icon(Icons.person),
        // labelText: 'Email address',
        hintText: 'Enter your full name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        // errorText: errorMessage,
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null) {
          return 'Full name cannot be empty.';
        }
        return null;
      },

      // onSaved: (value) {
      //   emailAddress = value as String;
      // },

    );

  }

  Widget passwordField() {

    return TextFormField(

      controller: passwordController,
      obscureText: !showPassword,
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

  Widget confirmPasswordField() {

    return TextFormField(

      // controller: passwordController,
      obscureText: !showPassword,
      maxLines: 1,

      decoration: InputDecoration(
        // icon: Icon(Icons.security_rounded),
        prefixIcon: const Icon(Icons.lock),
        // labelText: 'Password',
        hintText: 'Confirm your password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        // errorText: errorMessage,
      ),

      validator: (value) {
          if (value!.isEmpty || value == '' || value == null) {
            return 'Confirm password cannot be empty!';
          } else if (value != passwordController.text) {
            return 'This didn\'t match the password above! Please try again.';
          }
          return null;
      },

      // onSaved: (value) {
      //   password = value as String;
      // },

    );

  }

  Widget showPasswordCheckbox() {

    return CheckboxListTile(

      title: const Text('Show password'),

      // contentPadding: EdgeInsets.zero,
      activeColor: Theme.of(context).colorScheme.primary,
      controlAffinity: ListTileControlAffinity.leading,

      value: showPassword,

      onChanged: (newValue) {
        FocusScope.of(context).unfocus();
        setState(() {
          showPassword = newValue!;
        });
      },

    );

  }

  Widget registerButton() {

    return ElevatedButton(

      child: const Text('Sign up', style: TextStyle(fontWeight: FontWeight.bold,),),

      style: ElevatedButton.styleFrom(
        // elevation: 0,
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
      ),

      onPressed: () async {

        FocusScope.of(context).unfocus();

        if(_formKey.currentState!.validate()) {

          // _formKey.currentState!.save();

          emailAddress = emailController.text;
          username = usernameController.text;
          password = passwordController.text;

          await auth.createUser(emailAddress.trim(), username.trim(), password.trim()).then((value) {
            if (value == null) {
              setState(() {
                Fluttertoast.showToast(msg: 'Signed up Successfully', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
              });
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHome(tabIndex: 0, bookingHistory: false,),), (_) => false,);
            } else {
              setState(() {
                Fluttertoast.showToast(msg: value, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red, timeInSecForIosWeb: 5,);
              });
            }
          });

          print('emailAddress: $emailAddress, password: $password');

        }

      },

    );

  }

}