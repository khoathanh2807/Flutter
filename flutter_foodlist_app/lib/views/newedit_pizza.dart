import 'package:flutter/material.dart';
import 'dart:convert';

import './app.dart';
import '../models/pizza.dart';
import '../utils/http_helper.dart';

class NewEditPizza extends StatefulWidget {

  late Pizza pizza;

  NewEditPizza({Key? key, required this.pizza}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NewEditPizzaState();
  }

}

class NewEditPizzaState extends State<NewEditPizza>{

  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();

  @override
  void initState() {
    var p = widget.pizza;
    nameController.text = p.pizzaName;
    descriptionController.text = p.description ?? '';
    priceController.text = (p.price != null) ? p.price.toString() : '';
  }

  String saveResult = '';

  @override
  Widget build(BuildContext context) {

    var p = widget.pizza;

    return Scaffold(

      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.of(context).pushReplacementNamed('/');
            // Navigator.pushReplacementNamed(context, '/');
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainHome()));
          },
        ),

        title: Text(p.id == null ? 'New pizza' : 'Update pizza'),

      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(

            children: [
              _message(),
              _fieldName(),
              _fieldDescription(),
              _fieldPrice(),
              Container(margin: EdgeInsets.only(top: 30.0),),
              _buttonSave(),
            ],

          ),
        ),
      ),

    );

  }

  Widget _message() {
    return Text(saveResult);
  }

  Widget _fieldName() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: 'Name',
      ),
    );
  }

  Widget _fieldDescription() {
    return TextFormField(
      controller: descriptionController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: 'Description',
        helperMaxLines: 3
      ),
    );
  }

  Widget _fieldPrice() {
    return TextFormField(
      controller: priceController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Price'
      ),
    );
  }

  Widget _buttonSave() {
    return ElevatedButton(
        onPressed: () {
          _savePizza();
          // Navigator.of(context).pushReplacementNamed('/');
          // Navigator.pushReplacementNamed(context, '/');
          // Navigator.push(context, MaterialPageRoute(builder: (context) => MainHome()));
        },
        child: Text('Save')
    );
  }

  void _savePizza() async {

    var httpHelper = HttpHelper();
    var pizza = widget.pizza;

    pizza.pizzaName = nameController.text;
    pizza.description = descriptionController.text;
    pizza.price = priceController.text.isNotEmpty ? double.parse(priceController.text) : null;

    var jsonPizza = pizza.toJson();
    print(jsonPizza);

    var response;
    if (pizza.id == null) {

      // New
      response = await httpHelper.postPizza(pizza);

      if (response.statusCode == 201) {
        print('Save the pizza successfully.');
        print('Response message = ${response.body}');
      } else {
        print('Could not save the pizza.');
        print('Response message = ${response.body}');
      }

    } else {

      // Update
      response = await httpHelper.putPizza(pizza);

      if (response.statusCode == 200) {
        print('Update the pizza successfully.');
        print('Response message = ${response.body}');
      } else {
        print('Could not update the pizza.');
        print('Response message = ${response.body}');
      }

    }

    setState(() {
      saveResult = jsonDecode(response.body)['response_message'];
    });

  }

}