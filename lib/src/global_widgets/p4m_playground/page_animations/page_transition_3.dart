import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  final Widget page;
  final String routeName;
  
  FadePageRoute({required this.page, required this.routeName})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );

  @override
  RouteSettings get settings => RouteSettings(name: routeName);
}
