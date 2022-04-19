import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:week8_lythuyet/module/Site.dart';
import '../lib/sakai_services.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  var sakaiServices = SakaiService(sakaiUrl: 'https://xlms.myworkspace.vn');
  //var sakaiServices = SakaiService(sakaiUrl: 'http://localhost:8080');

  test('Test authentication #1', () async {
    http.Response response = await sakaiServices.authenticate('loc2007121@gmail.com', 'Longjump2001');

    // if (kDebugMode) {
    //   print('body=${response.body}');
    // }

    // expect(response.statusCode == 200 || response.statusCode == 201, true);
    // expect(sakaiServices.token!.length, 36);

  });

  // test('Test authentication #2', () {
  //   sakaiServices.authenticate('loc2007121@gmail.com', 'Longjump2001')
  //       .then((response) {
  //     if (kDebugMode) {
  //       print('body=${response.body}');
  //     }
  //     expect(response.statusCode == 200 || response.statusCode == 201, true);
  //
  //     var token = sakaiServices.token;
  //     expect(token!.length, 36);
  //
  //     print('value=$token');
  //
  //     String? jsessionId = sakaiServices.parseCookieJSessionID(response);
  //     print('sessionId=$jsessionId');
  //     print('Headers:');
  //     for (var key in response.headers.keys) {
  //       var value = response.headers[key];
  //       print('$key=$value');
  //     }
  //
  //
  //   });
  //
  // });

  // Refer: https://docs.flutter.dev/cookbook/networking/authenticated-requests
  test('Test checkSession', () async {

    var result = await sakaiServices.checkSession();
    // if (kDebugMode) {
    //   print('Session info:=\n${result.body}');
    // }

  });

  test('Test getSites', () async {

    var result = await sakaiServices.getSites();

    var jSite = json.decode(result.body);
    List jSite_collection = jSite['site_collection'];

    List<Site> sites = [];

    jSite_collection.forEach((site) {
      Site mySite = Site(id: site['entityId'],title: site['entityTitle'], Owner: site['siteOwner']['userDisplayName']);
      sites.add(mySite);
    });

    print(sites[0].Owner );
    //print(jSite);


  });
}