library convertstring_util;

class ConvertString {

  /// Count the amount of words in [stringInput].
  int countWord(String? stringInput){

    if (stringInput == '' || stringInput == ' ' || stringInput == null || stringInput.isEmpty) {
      return 0;
    }

    int countResultOutput = stringInput.split(" ").length;
    return countResultOutput;

  }

  String? removeAccents(String? stringInput) {

    final accentsMap = [
      "aàảãáạăằẳẵắặâầẩẫấậ",
      "AÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬ",
      "eèẻẽéẹêềểễếệ",
      "EÈẺẼÉẸÊỀỂỄẾỆ",
      "iìỉĩíị",
      "IÌỈĨÍỊ",
      "yỳỷỹýỵ",
      "YỲỶỸÝỴ",
      "oòỏõóọôồổỗốộơờởỡớợ",
      "OÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢ",
      "uùủũúụưừửữứự",
      "UÙỦŨÚỤƯỪỬỮỨỰ",
      "dđ",
      "DĐ",
    ];

    for (var i = 0; i < accentsMap.length; i++) {

      RegExp regex = RegExp('[' + accentsMap[i].substring(1) + ']');

      var char = accentsMap[i][0]; // non-accent letter

      stringInput = stringInput!.replaceAllMapped(regex, (match) {
        return char;
      });

    }

    return stringInput;

  }

}