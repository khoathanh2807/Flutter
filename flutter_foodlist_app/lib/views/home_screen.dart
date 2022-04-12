import 'package:flutter/material.dart';
import 'dart:convert';

import '../data_provider.dart';
import './newedit_pizza.dart';
import '../models/pizza.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pizzaController = DataProvider.of(context);
    return Scaffold(

      appBar: AppBar(
        title: Text('Home'),
        actions: [
          ElevatedButton(
              onPressed: () {
                _changeModeDelete(context);
              },
              child: Text('Delete mode')),
        ],
      ),

      body: Container(
        child: FutureBuilder(
          future: pizzaController.callPizzas(), // callPizzas(), //readJsonFile(context),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
            return ListView.builder(

                itemCount: pizzas.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {

                  var itemData = pizzas.data![index];

                  return ListTile(
                    title: Text(itemData.pizzaName),
                    subtitle: Text("${itemData.description } \$ ${itemData.price}"),
                    onTap: () {
                      _editPizza(context, itemData);
                    },
                  );

                },

            );
          },
        ),
      ),

    );
  }

  Future<List<Pizza>> readJsonFile(context) async {

    String myString = await DefaultAssetBundle.of(context).loadString('assets/pizza_list.json');

    List myMap = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    myMap.forEach((dynamic pizza) {
      Pizza myPizza = Pizza.fromJson(pizza);
      // Pizza myPizza = Pizza.fromJsonOrNull(pizza);
      myPizzas.add(myPizza);
    });

    return myPizzas;

  }

  void _editPizza(context, Pizza pizza) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => NewEditPizza(pizza: pizza)
    ));
  }

  void _changeModeDelete(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/list_pizza');
  }

}