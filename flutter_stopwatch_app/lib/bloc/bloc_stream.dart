import 'dart:async';

class Bloc {

  final _emailStreamController = StreamController<String>();
  final _passwordStreamController = StreamController<String>();

  final emailTransformer = StreamTransformer<String, String>.fromHandlers(

      handleData: (String email, sink) {
        if (email.isEmpty || email == '') {
          // sink.add(email);
          sink.addError('Email cannot be empty.');
        } else if (email.contains('@') && email.contains('.')) {
          // sink.add(email);
          sink.addError('');
        } else {
          sink.addError('$email is an invalid email!');
        }
      },

      handleDone: (sink) => sink.close()

  );

  get changeEmail => _emailStreamController.sink.add;
  Stream<String> get streamEmail => _emailStreamController.stream.transform(emailTransformer);


  final passwordTransformer = StreamTransformer<String, String>.fromHandlers(

      handleData: (String password, sink) {
        if (password.isEmpty || password == '') {
          // sink.add(email);
          sink.addError('Password cannot be empty.');
        } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)) {
          sink.addError('Valid password must have at least 8 characters which include minimum 1 Uppercase, 1 Lowercase, 1 Number and 1 Special character.');
        } else {
          sink.addError('');
        }
      },

      handleDone: (sink) => sink.close()

  );

  get changePassword => _passwordStreamController.sink.add;
  Stream<String> get streamPassword => _passwordStreamController.stream.transform(passwordTransformer);

  dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }

}