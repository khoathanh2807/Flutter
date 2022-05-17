import 'package:flutter/material.dart';
import 'dart:convert';

import '../data_provider.dart';
import './newedit_pizza.dart';
import '../models/pizza.dart';
import '../utils/http_helper.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {

    var pizzaController = DataProvider.of(context);

    return Scaffold(

      // appBar: AppBar(
      //   title: Text('Home'),
      //   actions: [
      //     ElevatedButton(
      //         child: Text('Delete mode'),
      //         onPressed: () {
      //           _changeModeDelete(context);
      //         },
      //     ),
      //   ],
      // ),

      appBar: AppBar(
        title: const Text('Pizza List'),
        elevation: 0,
        actions: [
          _addPizza()
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(30),
        child: FutureBuilder(

          future: pizzaController.callPizzas(),  //readJsonFile(context),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {

            return ListView.separated(

                itemCount: pizzas.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {

                  var itemData = pizzas.data![index];

                  // return ListTile(
                  //   title: Text(itemData.pizzaName),
                  //   subtitle: Text("${itemData.description } \$ ${itemData.price}"),
                  //   onTap: () {
                  //     _editPizza(context, itemData);
                  //   },
                  // );

                  return Dismissible(

                    key: Key(itemData.id.toString()),
                    child: ListTile(

                        title: Text(itemData.pizzaName),
                        subtitle: Text("${itemData.description } - \$${itemData.price}"),

                        onTap: () {
                            _editPizza(context, itemData);
                        },

                    ),

                    onDismissed: (item) {

                      HttpHelper httpHelper = HttpHelper();
                      httpHelper.deletePizza(item.index);

                    },

                  );

                },

                separatorBuilder: (BuildContext context, int index) => const Divider(),

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
    // Navigator.of(context).pushReplacementNamed('/add_pizza');
    // Navigator.pushReplacementNamed(context, '/add_pizza');
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewEditPizza(pizza: pizza)));
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewEditPizza(pizza: pizza)));
  }

  // void _changeModeDelete(BuildContext context) {
  //   Navigator.pushReplacementNamed(context, '/list_pizza');
  // }

  Widget _addPizza() {

    Pizza defaultPizza = Pizza.createDefault();

    return IconButton(

      icon: Icon(Icons.add),
      tooltip: 'Add Pizza',
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed('/add_pizza');
        // Navigator.pushReplacementNamed(context, '/add_pizza');
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewEditPizza(pizza: defaultPizza)));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewEditPizza(pizza: defaultPizza)));
      },

    );

  }

}