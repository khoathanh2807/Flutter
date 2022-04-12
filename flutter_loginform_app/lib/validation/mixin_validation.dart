mixin ComonValidation {

  String? validateEmail (String? value) {

    if (value!.isEmpty || value == '') {
      return 'Email address cannot be empty.';
    } else if(!value.contains('@') || !value.contains('.')) {
      return 'Please input valid email!';
    }
    return null;

  }

  String? validatePassword (String? value) {

    if (value!.isEmpty || value == '') {
      return 'Password cannot be empty.';
    }

    if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){

      return 'Valid password must have at least 8 characters which include minimum 1 Uppercase, 1 Lowercase, 1 Number and 1 Special character.';

    }

    return null;

  }

}