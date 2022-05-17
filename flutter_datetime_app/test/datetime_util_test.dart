import 'package:flutter_test/flutter_test.dart';

import '../lib/datetime_util.dart';

void main() {

  test('Add n working days to a datetime now.', () {

    DateTime now = DateTime.now();
    var currentDay = DateTime(now.year, now.month, now.day);

    expect(DatetimeUtility.addWorkingDay(currentDay, 3), DatetimeUtility.parse('2022-4-15', 'yyyy-MM-dd'));

  });

}
