import 'package:flutter/material.dart';

//in use for the app, the other two transitions were experimental
PageRouteBuilder<dynamic> createRouteWithTransition(
    Widget page, String routeName) {
  return PageRouteBuilder(
    settings: RouteSettings(name: routeName),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
