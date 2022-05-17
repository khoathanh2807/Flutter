import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../lib/sakai_services.dart';

void main() {

  var sakaiServices = SakaiService(sakaiUrl: 'https://xlms.myworkspace.vn');

  test('Test authentication #1', () async {

    http.Response response = await sakaiServices.authenticate('lnthach@gmail.com', 'demo123');

    expect(response.statusCode == 200 || response.statusCode == 201, true);
    expect(sakaiServices.token!.length, 36);

  });


  test('Test getSites and parse to JSON', () async {

    var result = await sakaiServices.getSites();

    if (kDebugMode) {
      print('Test getSites and parse to JSON; result := \n${result.body}');
    }

    var jsonSites = json.decode(result.body);

    // in ra danh sach cac khoa hoc da tham gia
    print('jsonSites := $jsonSites');

    // expect(jsonSites['entityPrefix'], 'site');
    // expect(jsonSites['site_collection'][0]['id'], 'ac94ea73-708f-40d2-bd77-83a89be883be');
    // expect(jsonSites['site_collection'][0]['entityTitle'], 'English');
    // expect(jsonSites['site_collection'][0]['entityTitle'], 'English');
    //
    // expect(jsonSites['site_collection'][1]['id'], 'a9cefcca-b328-419c-a289-ae38393aff01');
    // expect(jsonSites['site_collection'][1]['entityTitle'], 'Mobile-Flutter');
    // expect(jsonSites['site_collection'][1]['entityId'], 'a9cefcca-b328-419c-a289-ae38393aff01');

  });

}