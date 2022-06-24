import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../controllers/airport_controller.dart';
import '../../models/airport.dart';

class AirportScreen extends StatefulWidget {

  @override
  State<AirportScreen> createState() => AirportScreenState();

}

class AirportScreenState extends State<AirportScreen> {

  final _formKey = GlobalKey<FormState>();

  final locationNameController = TextEditingController();
  final locationSymbolController = TextEditingController();
  final airportController = TextEditingController();

  var locationNameClearButtonVisible = false;
  var locationSymbolClearButtonVisible = false;
  var airportClearButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Airport', style: TextStyle(fontWeight: FontWeight.w600,),),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                locationSymbolField(),
                const SizedBox(height: 20,),

                locationNameField(),
                const SizedBox(height: 20,),

                airportField(),
                const SizedBox(height: 35,),

                confirmButton(),

              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget locationNameField() {

    return TextFormField(

      controller: locationNameController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: locationNameClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                locationNameController.clear();
                locationNameClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Location name',
        hintText: 'Enter Location name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          locationNameController.text.isNotEmpty ? locationNameClearButtonVisible = true : locationNameClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget locationSymbolField() {

    return TextFormField(

      controller: locationSymbolController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: locationSymbolClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                locationSymbolController.clear();
                locationSymbolClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Location symbol',
        hintText: 'Enter Location symbol',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          locationSymbolController.text.isNotEmpty ? locationSymbolClearButtonVisible = true : locationSymbolClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget airportField() {

    return TextFormField(

      controller: airportController,
      textAlign: TextAlign.center,

      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: airportClearButtonVisible,
          child: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey, size: 17,),
            onPressed: () {
              setState(() {
                airportController.clear();
                airportClearButtonVisible = false;
              });
            },
          ),
        ),
        labelText: 'Airport',
        hintText: 'Enter Airport',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: EdgeInsets.only(left: 30, right: 5, top: 21, bottom: 21,),
      ),

      onChanged: (value) {
        setState(() {
          airportController.text.isNotEmpty ? airportClearButtonVisible = true : airportClearButtonVisible = false;
        });
      },

      validator: (value) {
        return (value!.isEmpty || value == '' || value == null) ? 'This field cannot be empty!' : null;
      },

    );

  }

  Widget confirmButton() {

    return ElevatedButton(

        child: Text('Confirm', style: TextStyle(fontWeight: FontWeight.bold,),),

        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
        ),

        onPressed: () async {
          FocusScope.of(context).unfocus();
          if(_formKey.currentState!.validate()) {

            final newAirport = Airport(
                locationName: locationNameController.text,
                locationSymbol: locationSymbolController.text,
                airport: airportController.text,
            );

            await AirportController().createAirport(newAirport).whenComplete(() {
              Fluttertoast.showToast(msg: 'Successfully Created New Airport!', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue, timeInSecForIosWeb: 3,);
            }).catchError((error) {
              Fluttertoast.showToast(msg: 'Error: $error', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red, timeInSecForIosWeb: 5,);
            });

          }
        },

    );

  }

}