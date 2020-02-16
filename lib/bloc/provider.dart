import 'package:flutter/material.dart';
import 'package:login/bloc/bloc.dart';

class Provider extends InheritedWidget {
  Provider({
    Key key,
    Widget child,
  }) : super(
          key: key,
          child: child,
        );

  //Instace BLOC
  final Bloc bloc = Bloc();

  static Bloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().bloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
