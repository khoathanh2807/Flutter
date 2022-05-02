library string_util;

class convertString {

  late String n;

  convertString.countWord(String n){
    this.n = n;
    print(n.split(" ").length);
  }

  convertString.removeAccents(String n) {
    this.n =n;
    final accentsMap = [
      "aàảãáạăằẳẵắặâầẩẫấậ",
      "AÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬ",
      "dđ",
      "DĐ",
      "eèẻẽéẹêềểễếệ",
      "EÈẺẼÉẸÊỀỂỄẾỆ",
      "iìỉĩíị",
      "IÌỈĨÍỊ",
      "oòỏõóọôồổỗốộơờởỡớợ",
      "OÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢ",
      "uùủũúụưừửữứự",
      "UÙỦŨÚỤƯỪỬỮỨỰ",
      "yỳỷỹýỵ",
      "YỲỶỸÝỴ"
    ];

    for (var i = 0; i < accentsMap.length; i++) {
      RegExp regex = RegExp('[' + accentsMap[i].substring(1) + ']');
      var char = accentsMap[i][0]; // non-accent letter
      n = n.replaceAllMapped(regex, (match) {
        return char;
      });
    }

    print(n);

  }

}
