import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/validation/mixin_login_validation.dart';
import '../../controllers/authentication/firebase_authentication.dart';
import '../app.dart';
import './register_screen.dart';

class LoginScreen extends StatefulWidget {

  // const LoginScreen({Key? key, required this.title}) : super(key: key);
  // final String title;
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> with LoginValidation {

  final _formKey = GlobalKey<FormState>();
  var rememberLogin = false;

  late String emailAddress;
  late String password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // String? errorMessage;

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
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              const SizedBox(height: 50,),

              const Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,),),

              const SizedBox(height: 60,),

              Form(
                key: _formKey,
                child: Column(
                  children: [

                    emailField(),       // Email Text Field

                    const SizedBox(height: 20,),

                    passwordField(),    // Password Text Field

                    // rememberMeCheckbox(),

                    const SizedBox(height: 35,),

                    loginButton(),      // Login Confirm Button

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Text('Not registered yet?'),

                        TextButton(
                          child: const Text('Create an account', style: TextStyle(fontWeight: FontWeight.bold,),),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),),);
                          },
                        ),

                      ],
                    ),

                    const SizedBox(height: 50,),

                    loginGoogleButton(),

                    const SizedBox(height: 20,),

                    loginAppleButton(),

                  ],
                ),
              ),

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
                prefixIcon: const Icon(Icons.email),
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
        FocusScope.of(context).unfocus();
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
          // elevation: 0,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0,),
        ),

        onPressed: () async {

            FocusScope.of(context).unfocus();

            if(_formKey.currentState!.validate()) {

                  // _formKey.currentState!.save();

                  emailAddress = emailController.text;
                  password = passwordController.text;

                  await auth.login(emailAddress.trim(), password.trim(),).whenComplete(() {}).then((value) {   // đăng nhập Firebase bằng email và password
                    if (value == null) {
                      setState(() {
                        Fluttertoast.showToast(msg: 'Signed in Successfully', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
                      });
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHome(tabIndex: 0, bookingHistory: false,),), (_) => false,);
                    } else {
                      setState(() {
                        Fluttertoast.showToast(msg: value, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
                      });
                    }
                  });

                  print('emailAddress: $emailAddress, password: $password');

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const MainHome(),),);
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainHome(),),);
                  // Navigator.pushReplacementNamed(context, '/', arguments: emailAddress,);
                  // Navigator.of(context).pushReplacementNamed('/', arguments: emailAddress,);
                  // Navigator.of(context).popAndPushNamed('/', arguments: emailAddress,);
                  // Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: emailAddress,);

            }

        },

    );

  }

  Widget loginGoogleButton() {
    return ElevatedButton(

      // child: Text('Log in with Google', style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(FontAwesomeIcons.google, color: Colors.black87, size: 22),
          SizedBox(width: 10,),
          Text('Sign in with Google', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),),
        ],
      ),

      style: ButtonStyle(
        // elevation: MaterialStateProperty.all(0),
        // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(const EdgeInsets.only(top: 16, bottom: 16,),),
        // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30, color: Colors.black),)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: const BorderSide(color: Colors.black26),
          ),
        ),
      ),

      onPressed: () async {   // đăng nhập Firebase bằng account Google
        await auth.loginWithGoogle().whenComplete(() {}).then((value) {
          if (value == null) {
            setState(() {
              Fluttertoast.showToast(msg: 'Signed in with Google Successfully', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue);
            });
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHome(tabIndex: 0, bookingHistory: false,),), (_) => false,);
          } else {
            setState(() {
              Fluttertoast.showToast(msg: value, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
            });
          }
        });
      },

    );
  }

  Widget loginAppleButton() {
    return ElevatedButton(

      // child: Text('Log in with Google', style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(FontAwesomeIcons.apple, color: Colors.black87, size: 29),
          SizedBox(width: 10,),
          Text('Sign in with Apple', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),),
        ],
      ),

      style: ButtonStyle(
        // elevation: MaterialStateProperty.all(0),
        // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight),
        backgroundColor: MaterialStateProperty.all(Colors.white,),
        padding: MaterialStateProperty.all(const EdgeInsets.only(top: 14, bottom: 14,)),
        // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30, color: Colors.black),)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0,),
            side: const BorderSide(color: Colors.black26,),
          ),
        ),
      ),

      onPressed: () {

        Fluttertoast.showToast(msg: 'Coming Soon!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.grey,);

      },

    );
  }

}