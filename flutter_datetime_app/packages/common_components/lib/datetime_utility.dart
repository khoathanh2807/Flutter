library datetime_util;
import 'dart:core';
import 'package:intl/intl.dart';

/// A DateTime Utility.
class DatetimeUtility {

  static DateTime parse(String input_datetime_value, String datetime_format) {
    return DateFormat(datetime_format).parse(input_datetime_value);
  }

  /// Returns datetime value after 'n working days' of datetime
  static DateTime addWorkingDay(DateTime datetime, int nday) => datetime.add(Duration(days: nday));

}