import '../models/pizza.dart';
import '../utils/httphelper.dart';

class PizzaController {

  Future<List<Pizza>> callPizzas() async {

    print('Use HttpHelper to get list of pizzas...');
    HttpHelper helper = HttpHelper();
    List<Pizza> pizzas = await helper.getPizzaList();

    return pizzas;

  }

}