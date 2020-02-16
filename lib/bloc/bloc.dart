import 'dart:async';
import 'package:login/bloc/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  //Stream Controller
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Getter Stream with Transform
  //Validators for Transform from Validators class
  Stream<String> get usernameStream =>
      _usernameController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get formValidator => CombineLatestStream.combine2(
      usernameStream, passwordStream, (a, b) => true);

  get username => _usernameController.value;
  get password => _passwordController.value;

  //Getter Sink
  Function(String) get usernameSink => _usernameController.sink.add;
  Function(String) get passwordSink => _passwordController.sink.add;

  //Close Stream
  dispose() {
    _usernameController?.close();
    _passwordController?.close();
  }
}
