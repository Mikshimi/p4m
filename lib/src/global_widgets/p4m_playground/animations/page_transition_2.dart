import 'package:flutter/material.dart';

// Define a custom page transition
Route<dynamic> customPageTransition(
    RouteSettings settings, WidgetBuilder builder) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
