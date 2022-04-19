import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/src/response.dart';

import 'package:week8_lythuyet/sakai_services.dart';
import '../module/Site.dart';

class LoginScreen extends StatefulWidget{
  final String route = '/login';

  @override
  State<StatefulWidget> createState() => LoginState();

}

class LoginState extends State<StatefulWidget>{

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  
  final sakaiServices = SakaiService(sakaiUrl: 'https://xlms.myworkspace.vn');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 160,
          title: Text('Login', style: TextStyle(color: Colors.yellow),),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.indigoAccent,
                  Colors.deepPurpleAccent,
                  Colors.deepPurple
                ],
              )
            ),
          ),
        ),
      body: FormLogin(),
    );
  }

  Widget FormLogin(){
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Field_Username(),
          Field_Password(),
          Button_Login()
        ],
      ),
    );
  }

  Widget Field_Username(){
    return TextFormField(
      controller: username_controller,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'User name'
      ),
    );
  }

  Widget Field_Password(){
    return TextFormField(
      controller: password_controller,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.password),
          labelText: 'Password',
      ),
    );
  }

  Widget Button_Login(){
    return ElevatedButton(
      child: Text('Login'),
      onPressed: () async{
        String username = username_controller.text;
        String password = password_controller.text;

        Response response = await sakaiServices.authenticate(username, password);
        if(response.statusCode == 200 || response.statusCode == 201){

            var result = await sakaiServices.getSites();

            var jSite = json.decode(result.body);
            List jSite_collection = jSite['site_collection'];

            List<Site> sites = [];
            jSite_collection.forEach((site) {
              Site mySite = Site(id: site['entityId'],title: site['entityTitle'], Owner: site['siteOwner']['userDisplayName']);
              sites.add(mySite);
            });

            Fluttertoast.showToast(msg: 'Login successfully', fontSize: 20, backgroundColor: Colors.blue);
            Navigator.of(context).pushReplacementNamed('/SiteScreen', arguments: sites);
            setState(() {

            });
        }
        else{
            Fluttertoast.showToast(msg: 'Login fail', fontSize: 20, backgroundColor: Colors.red);
        }
      },

    );
  }
}