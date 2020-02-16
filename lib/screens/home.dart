import 'package:flutter/material.dart';
import 'package:login/bloc/bloc.dart';
import 'package:login/bloc/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bloc bloc = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('lib/assets/welcome.png'),
          ),
          Text(
            'Username: ${bloc.username}',
            style: Theme.of(context).textTheme.subtitle,
          ),
          Text(
            'Password: ${bloc.password}',
            style: Theme.of(context).textTheme.subtitle,
          )
        ],
      ),
    );
  }
}
