import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../lib/sakai_services.dart';

void main() {

  var sakaiServices = SakaiService(sakaiUrl: 'https://xlms.myworkspace.vn');

  test('Test authentication #1', () async {

    http.Response response = await sakaiServices.authenticate('lnthach@gmail.com', 'demo123');

    if (kDebugMode) {
      print('body = ${response.body}');
    }

    expect(response.statusCode == 200 || response.statusCode == 201, true);
    expect(sakaiServices.token!.length, 36);

  });

  test('Test authentication #2', () {

    sakaiServices.authenticate('lnthach@gmail.com', 'demo123').then((response) {

      if (kDebugMode) {
        print('body = ${response.body}');
      }

      expect(response.statusCode == 200 || response.statusCode == 201, true);

      var token = sakaiServices.token;
      expect(token!.length, 36);

      print('value = $token');

      String? jsessionId = sakaiServices.parseCookieJSessionID(response);
      print('sessionId = $jsessionId');

      print('Headers:');
      for (var key in response.headers.keys) {
        var value = response.headers[key];
        print('$key = $value');
      }

    });

  });

  // Refer: https://docs.flutter.dev/cookbook/networking/authenticated-requests
  test('Test checkSession', () async {

    var result = await sakaiServices.checkSession();

    if (kDebugMode) {
      print('Session info := \n${result.body}');
    }

  });

  test('Test getSites', () async {

    var result = await sakaiServices.getSites();

    if (kDebugMode) {
      print('Test getSites; result := \n${result.body}');
    }

  });

}