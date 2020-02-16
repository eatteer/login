import 'package:flutter/material.dart';
import 'package:login/bloc/provider.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => Login(),
          '/': (BuildContext context) => Home(),
        },
        theme: ThemeData(
          primaryColor: Colors.black,
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}
