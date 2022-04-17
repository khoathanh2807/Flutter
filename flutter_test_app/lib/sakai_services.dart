import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class SakaiService {
  // Ex: https://xlms.myworkspace.vn
  // without / at the end
  String sakaiUrl;

  // Ex: JSESSIONID=95b6f718-8187-4ac9-9fac-ae6c6209edd1.LAPTOP-I6R2E4C4
  String? cookie;
  String? token;

  SakaiService({required this.sakaiUrl});

  Future<http.Response> authenticate(String username, String password) async {
    // This will be sent as form data in the post request
    var map = new Map<String, dynamic>();
    map['_username'] = username;
    map['_password'] = password;

    final response = await http.post(
      Uri.parse('$sakaiUrl/direct/session'),
      body: map,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      cookie = parseCookieJSessionID(response);
      token = response.body;
    }
    return response;
  }

  // Ex: set-cookie=JSESSIONID=aaf03b84-c10a-4377-a3fa-4ec011dcd7da.LAPTOP-I6R2E4C4; Path=/; HttpOnly; SameSite=Lax
  String? parseCookieJSessionID(http.Response response) {
    // Ex: JSESSIONID=aaf03b84-c10a-4377-a3fa-4ec011dcd7da.LAPTOP-I6R2E4C4; Path=/; HttpOnly; SameSite=Lax
    var jsessionId = response.headers['set-cookie'];

    // RegExp exp = RegExp(r"JSESSIONID=([\w-.]+);");
    RegExp exp = RegExp(r"(JSESSIONID=[\w-.]+);");
    var matcher = exp.firstMatch(jsessionId as String);

    return matcher?.group(1);
  }

  Future<http.Response> checkSession() async {
    final response = await http.get(
      Uri.parse('$sakaiUrl/direct/session/current.json'),
    );

    return response;
  }


  Future<http.Response> getSites() async {
    return http.get(
      Uri.parse('$sakaiUrl/direct/site.json'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Bear $token',
        HttpHeaders.cookieHeader: '$cookie'
      },
    );
  }

}