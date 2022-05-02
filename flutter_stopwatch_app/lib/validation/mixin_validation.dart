mixin LoginValidation {

  String? validateEmail (String? value) {

    if (value!.isEmpty || value == '') {
      return 'Email address cannot be empty.';
    } else if(!value.contains('@') || !value.contains('.')) {
      return 'Please input a valid email!';
    }

    // final email_RegExp = RegExp('[^@]+@[^\.]+\..+');
    // if(!email_RegExp.hasMatch(value)){
    //   return 'Please enter a valid email!';
    // }

    return null;

  }

  String? validatePassword (String? value) {

    if (value!.isEmpty || value == '') {
      return 'Password cannot be empty.';
    }

    final password_RegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if(!password_RegExp.hasMatch(value)){
      return 'Valid password must have at least 8 characters which include minimum 1 Uppercase, 1 Lowercase, 1 Number and 1 Special character';
    }

    return null;

  }

}