class Event {

  late String image;
  String? link;

  Event({required this.image, this.link});

  Event.fromJson(Map<String, dynamic> json){
    image = json['image'] ?? '';
    link = json['link'] ?? '';
  }

}