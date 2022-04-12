import 'package:flutter/material.dart';

import '../controller/pizza_controller.dart';
import '../data_provider.dart';
import '../models/pizza.dart';
import '../utils/httphelper.dart';

class ListPizzaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var pizzaController = DataProvider.of(context);

    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: pizzaController.callPizzas(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
            return ListView.builder(
              itemCount: pizzas.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var itemData = pizzas.data![index];
                return Dismissible(
                  key: Key(itemData.id.toString()),
                  child: ListTile(
                    title: Text(itemData.pizzaName),
                    subtitle: Text(
                        "${itemData.description } \$ ${itemData.price}"),
                  ),
                  onDismissed: (item) {
                    HttpHelper httpHelper = HttpHelper();
                    httpHelper.deletePizza(item.index);
                  },
                );
              },
            );
          }
        ),
      ),
    );

  }

}