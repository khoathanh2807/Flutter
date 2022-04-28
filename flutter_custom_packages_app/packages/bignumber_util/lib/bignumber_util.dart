library bignumber_util;

class BigNumberUtil {

  /// Returns the sum of [value1] and [value2].
  BigNumberUtil.thirdGradeSum(String value1, String value2) {

    String sum = '';
    int len = value1.length > value2.length ? value1.length : value2.length;
    int spare = 0;

    while (len > 0) {

      int adden1 = value1 == '' ? 0 : int.parse(value1.trim().split('')[value1.length - 1]);
      int adden2 = value2 == '' ? 0 : int.parse(value2.trim().split('')[value2.length - 1]);
      int currentSum = spare + adden1 + adden2;

      if (currentSum >= 10) {
        String last =
        currentSum.toString().split('')[currentSum.toString().length - 1];
        sum = last + sum;
        spare = 1;
      } else {
        sum = currentSum.toString() + sum;
        spare = 0;
      }

      value1 = value1 == '' ? '' : value1.substring(0, value1.length - 1);
      value2 = value2 == '' ? '' : value2.substring(0, value2.length - 1);
      len--;

      if (len == 0 && spare == 1) {
        sum = spare.toString() + sum;
      }

    }

    print(sum);

  }

}
