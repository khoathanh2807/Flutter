library customsum_util;

class CustomSum {

  /// Returns the sum of [number1] and [number2].
  sum (String number1, String number2) {

    String sumResultOutput = '';
    int len = number1.length > number2.length ? number1.length : number2.length;
    int spare = 0;

    while (len > 0) {

      int adden1 = number1 == '' ? 0 : int.parse(number1.trim().split('')[number1.length - 1]);
      int adden2 = number2 == '' ? 0 : int.parse(number2.trim().split('')[number2.length - 1]);
      int currentSum = spare + adden1 + adden2;

      if (currentSum >= 10) {
        String last = currentSum.toString().split('')[currentSum.toString().length - 1];
        sumResultOutput = last + sumResultOutput;
        spare = 1;
      } else {
        sumResultOutput = currentSum.toString() + sumResultOutput;
        spare = 0;
      }

      number1 = number1 == '' ? '' : number1.substring(0, number1.length - 1);
      number2 = number2 == '' ? '' : number2.substring(0, number2.length - 1);
      len--;

      if (len == 0 && spare == 1) {
        sumResultOutput = spare.toString() + sumResultOutput;
      }

    }

    return sumResultOutput;

  }

}