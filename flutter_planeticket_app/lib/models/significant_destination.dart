class SignificantDestination {

  late String name;
  late String photoURL;

  SignificantDestination.createDefault() {
    name = '';
    photoURL = '';
  }

  SignificantDestination({
    required this.name,
    required this.photoURL,
  });

  SignificantDestination.fromJson(Map<String, dynamic> json){
    name = json['name'] ?? '';
    photoURL = json['photoURL'] ?? '';
  }

}