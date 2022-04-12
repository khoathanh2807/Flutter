const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

class Pizza {

  late int? id;
  late String pizzaName;
  late String? description;
  late double? price;
  late String? imageUrl;

  Pizza.createDefault() {
    id = null;
    pizzaName = '';
    description = '';
    price = null;
    imageUrl = '';
  }

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl
  });

  Pizza.fromJson(Map<String, dynamic> json) {
    this.id = json['id'] ?? 0;
    this.pizzaName = json[keyName] ?? '';
    this.description = json[keyDescription] ?? '';
    this.price = json[keyPrice] ?? 0.0;
    this.imageUrl = json[keyImage] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }

}