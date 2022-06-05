import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../validation/mixin_validation.dart';

class AddressModel {

  String? name;
  // List<AddressModel>? districts;

  // AddressModel(this.name, this.districts);
  AddressModel(this.name);

  AddressModel.fromJson(jsonObject) {

    name = jsonObject['name'];
    // districts = jsonObject['district.name'];

  }

  String toString() {

    // return '($name, $districts)';
    return '($name)';

  }

}


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Input Form',
      home: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Demo Input Form')),
        // body: SingleChildScrollView(child: LoginScreen()),
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

  int counter = 0;
  List<AddressModel> addressList = [];

  fetchAddress() async {

    counter++;

    var url = Uri.https('provinces.open-api.vn', 'api/?depth=3');
    var response = await http.get(url);
    print(response.body);
    var jsonArray = json.decode(response.body);

    // var addressModel = AddressModel(jsonArray['name'], jsonArray['districts.name']);
    // addressList.add(addressModel);
    addressList = List<AddressModel>.from(
        jsonArray.map(
                (jsonObj) => AddressModel.fromJson(jsonObj)
        )
    );

    // Uri url = Uri.parse("provinces.open-api.vn/api/?depth=2");
    // http.get(url).then(
    //     (result) {
    //       print(result.body);
    //       var jsonArray = json.decode(result.body);
    //       addressList = List<AddressModel>.from(
    //           jsonArray.map(
    //                   (jsonObj) => AddressModel.fromJson(jsonObj)
    //           )
    //       );
    //     }
    // );

    print('counter = $counter');
    print('Length of addressList = ${addressList.length}');

    setState(() {
      //Do nothing
      print(addressList);
    });

  }

  final formKey = GlobalKey<FormState>();
  late String emailAddress;
  late String firstname;
  late String lastname;
  late String birthday;
  late String address;
  late String addressCountry;
  late String addressCity;
  late String addressDistrict;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
        child: Form(
          key: formKey,
          child: ListView(
            children: [

              fieldEmailAddress(),
              Container(margin: EdgeInsets.only(top: 20.0),),

              fieldLastname(),
              Container(margin: EdgeInsets.only(top: 20.0),),

              fieldFirstname(),
              Container(margin: EdgeInsets.only(top: 20.0),),

              fieldBirthday(),
              Container(margin: EdgeInsets.only(top: 20.0),),

              fieldAddressCountry(),
              Container(margin: EdgeInsets.only(top: 20.0),),

              fieldAddressCity(),
              Container(margin: EdgeInsets.only(top: 20.0),),

              fieldAddressDistrict(),
              Container(margin: EdgeInsets.only(top: 20.0),),

              fieldAddress(),
              Container(margin: EdgeInsets.only(top: 40.0),),

              confirmButton()

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
          labelText: 'Email address',
          // labelStyle: TextStyle(fontSize: 16.0),
          hintText: 'Enter your email',
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      validator: validateEmail,
      onSaved: (value) {
        emailAddress = value as String;
      },
    );

  }

  Widget fieldFirstname() {

    return TextFormField(

      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Firstname',
          // labelStyle: TextStyle(fontSize: 16.0),
          hintText: 'Enter your firstname',
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      validator: validateFirstname,
      onSaved: (value) {
        firstname = value as String;
      },
    );

  }

  Widget fieldLastname() {

    return TextFormField(

      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Lastname',
          // labelStyle: TextStyle(fontSize: 16.0),
          hintText: 'Enter your lastname',
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      validator: validateLastname,
      onSaved: (value) {
        lastname = value as String;
      },
    );

  }

  Widget fieldBirthday() {

    return TextFormField(

      decoration: InputDecoration(
          icon: Icon(Icons.calendar_today),
          labelText: 'Birthday',
          // labelStyle: TextStyle(fontSize: 16.0),
          hintText: 'Enter your birthday',
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      validator: validateBirthday,
      onSaved: (value) {
        birthday = value as String;
      },
    );

  }

  Widget fieldAddressCountry() {

    var countries = [
      "Vietnam",
      "Japan",
      "China",
      "Russia",
      "French",
      "Germany",
      "United Kingdom",
      "United States",
    ];

    return DropdownButtonFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.location_pin),
          labelText: 'Country',
          hintText: 'Selecty your country',
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0,),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        ),
        value: "Vietnam",
        items: countries.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            addressCountry = value as String;
          });
        },
        onSaved: (value) {
          addressCountry = value as String;
        },
        validator: validateDropdownFormField,
        // validator: (value) => value == null ? "Select your country" : null,
    );

  }



  Widget fieldAddressCity() {

    var cities = [
      "Ho Chi Minh City",
      "Hanoi",
      "Da Nang",
    ];
    // String? selectedValue = null;

    return DropdownButtonFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.location_pin),
        labelText: 'City',
        hintText: 'Selecty your city',
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
      ),
      // value: selectedValue,
      items: cities.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        addressCity = value as String;
      },
      onSaved: (value) {
        addressCity = value as String;
      },
      validator: validateDropdownFormField,
      // validator: (value) => value == null ? "Select your city" : null,
    );

  }

  Widget fieldAddressDistrict() {

    var districts = [
      "District 1",
      "District 2",
      "District 3",
      "District 4",
      "District 5",
    ];
    // String? selectedValue = null;

    return DropdownButtonFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.location_pin),
        labelText: 'District',
        hintText: 'Selecty your district',
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      // value: selectedValue,
      items: districts.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        addressDistrict = value as String;
      },
      onSaved: (value) {
        addressDistrict = value as String;
      },
      validator: validateDropdownFormField,
      // validator: (value) => value == null ? "Select your city" : null,
    );

  }

  Widget fieldAddress() {

    return TextFormField(

      decoration: InputDecoration(
          icon: Icon(Icons.location_pin),
          labelText: 'Address',
          // labelStyle: TextStyle(fontSize: 16.0),
          hintText: 'Enter your address',
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      validator: validateAddress,
      onSaved: (value) {
        address = value as String;
      },
    );

  }

  Widget confirmButton() {

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
        ),
        child: Text('Confirm'),
        onPressed: () {

          fetchAddress();

          if(formKey.currentState!.validate()) {
            // Call API Authentication from Backend to Login
            formKey.currentState!.save();
            print('$emailAddress, $lastname, $firstname, $birthday, $address, $addressCountry, $addressCity, $addressDistrict');
          };
          // print('Clicked / Touched Login Button');
        },
    );

  }

}