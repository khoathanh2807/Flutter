mixin ComonValidation {

  String? validateEmail (String? value) {

    if (value!.isEmpty) {
      return 'This field cannot be empty.';
    } else if(!value.contains('@') || !value.contains('.')) {
      return 'Please input valid email!';
    }
    return null;

  }

  String? validateLastname (String? value) {

    if (value!.isEmpty) {
      return 'This field cannot be empty.';
    }

    return null;

  }

  String? validateFirstname (String? value) {

    if (value!.isEmpty) {
      return 'This field cannot be empty.';
    }

    return null;

  }

  String? validateBirthday (String? value) {

    if (value!.isEmpty) {
      return 'This field cannot be empty.';
    }

    return null;

  }

  String? validateAddress (String? value) {

    if (value!.isEmpty) {
      return 'This field cannot be empty.';
    }

    return null;

  }

}