import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/pizza.dart';

// Improve creating instance of HttpHelper by Factory Pattern: Singleton Pattern
class HttpHelper {

  final String server = 'khoathanh.mocklab.io';
  final String path = 'pizzalist';
  final String postPath = 'pizzalist';
  final String putPath = 'pizzalist';
  final String deletePath = 'pizzalist';

  // GET
  Future<List<Pizza>> getPizzaList() async {

    Uri url = Uri.https(server, path);
    http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {

      final jsonResponse = json.decode(result.body);
      //provide a type argument to the map method to avoid type error
      List<Pizza> pizzas = jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();

      return pizzas;

    } else {
      print(result.reasonPhrase);
      return [];
    }

  }

  // POST
  Future<http.Response> postPizza(Pizza pizza) {

    Uri url = Uri.https(server, postPath);
    String post = json.encode(pizza.toJson());

    return http.post(
      url,
      body: post,
    );

  }

  // PUT
  Future<http.Response> putPizza(Pizza pizza) async {

    Uri url = Uri.https(server, putPath);
    String put = json.encode(pizza.toJson());

    return http.put(
      url,
      body: put,
    );

  }

  // DELETE
  Future<http.Response> deletePizza(int id) async {

    Uri url = Uri.https(server, deletePath);

    return http.delete(
      url,
      body: id
    );

  }

}
