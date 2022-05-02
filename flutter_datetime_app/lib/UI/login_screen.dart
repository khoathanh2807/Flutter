import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import '../sakai_services.dart';
// import 'package:common_components/sakai_services.dart';    // import package từ thư mục 'packages' nằm trong project này
import 'package:sakai_services/sakai_services.dart';          // import package từ git đã import link ở file pubspec.yaml

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final serverController = TextEditingController();

  // String? errorMessage;

  String loginErrorMessage1 = '';
  String loginErrorMessage2 = '';

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
                key: formKey,
                child: Column(
                  children: [

                    emailField(),
                    const SizedBox(height: 30,),

                    passwordField(),
                    const SizedBox(height: 30,),

                    serverField(),
                    const SizedBox(height: 40,),

                    loginButton(),
                    const SizedBox(height: 40,),

                    Text(loginErrorMessage1, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    Text(loginErrorMessage2, style: TextStyle(color: Colors.red))

                  ],
                ),
              )
            ]
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
        icon: Icon(Icons.person),
        // prefixIcon  : const Icon(Icons.email),
        labelText: 'Username / Email address',
        hintText: 'Input your Username / Email address',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        // errorText: errorMessage,
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null) {
          return 'Username / Email address cannot be empty.';
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
      obscureText: true,
      maxLines: 1,

      decoration: InputDecoration(
        icon: Icon(Icons.security_rounded),
        // prefixIcon: const Icon(Icons.lock),
        labelText: 'Password',
        hintText: 'Input your Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        // errorText: errorMessage,
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null) {
          return 'Password cannot be empty.';
        }
        return null;
      },

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
        // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        // errorText: errorMessage,
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null) {
          return 'Server address cannot be empty.';
        }
        return null;
      },

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

    if (formKey.currentState!.validate()) {

      final emailAddress = emailController.text;
      final password = passwordController.text;
      final serverAddress = serverController.text;

      print('username/emailAddress: $emailAddress, password: $password, server: $serverAddress');

      var sakaiService = SakaiService(sakaiUrl: serverAddress);

      sakaiService.authenticate(emailAddress, password).then((response) {

        print('login_authenticate_response_message: response.body = ${response.body}');

        String? token = sakaiService.token;
        print('login_authenticate_token: token = $token');

        if (response.statusCode == 200 || response.statusCode == 201) {

            setState(() {
              Fluttertoast.showToast(msg: 'Logged in successfully.', fontSize: 15, backgroundColor: Colors.blue);
            });

            print('Logged in successfully.');

            // Navigator.of(context).pushReplacementNamed('/');
            Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false, arguments: emailAddress);
            // Navigator.pushReplacementNamed(context, '/');
            // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

        } else {

          setState(() {

            loginErrorMessage1 = 'Login Failed!';
            loginErrorMessage2 = 'Please check again and enter the valid Username / Email address and Password.';

            Fluttertoast.showToast(msg: 'Login Failed!', fontSize: 15, backgroundColor: Colors.red);

          });

          print('Login Failed!');

        }

      });

    }

  }

}