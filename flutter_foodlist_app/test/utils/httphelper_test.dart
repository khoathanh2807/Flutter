import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:food_list/models/pizza.dart';
import '../../lib/utils/httphelper.dart';

void main() {
  var httpHelper = HttpHelper();
  test('Test get list of pizzas.', () async {
    var pizzasList = await httpHelper.getPizzaList();

    expect(pizzasList.isEmpty, false);

    print(pizzasList);


  });

  test('Test post pizza to server.', () async {
    var pizza = Pizza(
        id : 111,
        pizzaName : 'Milk1 Pi',
        description: 'None',
        imageUrl: 'None',
        price: 0.1
    );

    var jsonPizza = pizza.toJson();
    print(jsonPizza);

    var response = await httpHelper.postPizza(pizza);

    expect(response.statusCode, 201);
    var jsonBody = jsonDecode(response.body);
    expect(jsonBody['message'], 'The pizza was posted');

  });

  test('Test put pizza to server.', () async {
    var pizza = Pizza(
        id : 111,
        pizzaName : 'Cafe#1',
        description: 'None',
        imageUrl: 'None',
        price: 0.1
    );

    var response = await httpHelper.putPizza(pizza);

    expect(response.statusCode, 200);
    var jsonBody = jsonDecode(response.body);
    expect(jsonBody['message'], 'Pizza was updated');

  });
}