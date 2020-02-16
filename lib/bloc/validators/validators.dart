import 'dart:async';

class Validators {
  //Email validator
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      //
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      //Regular expressions are [Pattern]s, and can as such be used to match strings or parts of strings
      RegExp regExp = RegExp(pattern);
      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Type a correct email');
      }
    },
  );
  //Password validator
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 8) {
        sink.add(password);
      } else {
        sink.addError('Type at least 8 characters');
      }
    },
  );
}
