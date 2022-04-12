mixin ComonValidation {

  String? validateEmail (String? value) {

    if(!value!.contains('@') || !value.contains('.')) {
      return 'Please input a valid email!';
    }
    return null;

  }

  String? validateLastname (String? value) {

    if (value!.isEmpty || value == '') {
      return 'This field cannot be empty!';
    }

    return null;

  }

  String? validateFirstname (String? value) {

    if (value!.isEmpty || value == '') {
      return 'This field cannot be empty!';
    }

    return null;

  }

  String? validateBirthday (String? value) {

    if (value!.contains('/')) {
      return null;
    } else if (value.contains('-')) {
      return null;
    } else if (value.contains('.')) {
      return null;
    } else {
      return 'Please input a valid date!';
    }



  }

  String? validateAddress (String? value) {

    if (value!.isEmpty || value == '') {
      return 'This field cannot be empty!';
    }

    return null;

  }

  String? validateDropdownFormField (String? value) {

    if (value == null) {
      return 'This field cannot be empty!';
    }

    return null;

  }

}