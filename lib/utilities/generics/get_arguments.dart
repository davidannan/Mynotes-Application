import 'package:flutter/material.dart'show BuildContext, ModalRoute;

extension GetArgument on BuildContext {
T? getArgument<T>() {
  final modalRoute = ModalRoute.of(this);
  if(modalRoute != null) {
    final args = modalRoute.settings.arguments;
    if(args != null) {
      return args as T;
    }
  }
  return null;
}
}