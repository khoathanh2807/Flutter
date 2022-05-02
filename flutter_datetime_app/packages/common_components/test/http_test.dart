import 'dart:async';
import 'package:http/http.dart' as http;

void main() async {

  // This will be sent as form data in the post request
  var map = new Map<String, dynamic>();
  map['_username'] = 'lnthach@gmail.com';
  map['_password'] = 'demo123';

  final response = await http.post(

    Uri.parse('https://xlms.myworkspace.vn/direct/session'),
    body: map,

  );

  print(response.body);

}