import 'package:email_validator/email_validator.dart';

mixin LoginValidation {

  String? validateEmail (String? value) {

    if (value!.isEmpty || value == '' || value == null) {
        return 'Email address cannot be empty.';
    // } else if(!value.contains('@') || !value.contains('.')) {
    //     return 'Please input a valid email!';
    // }
    } else if (EmailValidator.validate(value) == false) {
        return 'Please enter a valid email!';
    }

    return null;

  }

  String? validatePassword (String? value) {

    if (value!.isEmpty || value == '' || value == null) {
      return 'Password cannot be empty.';
    } else if (value.length < 8) {
      // return 'The amount of characters must be greater than or equal to 8.';
      return 'Password must be at least 8 characters long.';
    }

    // if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
    //   return 'Valid password must have at least 8 characters which include minimum 1 Uppercase, 1 Lowercase, 1 Number and 1 Special character.';
    // }

    return null;

  }

}