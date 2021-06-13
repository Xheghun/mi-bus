import 'package:flutter/material.dart';
import './routes.dart';

class AppRoutes {
  static RouteSettings _route({String name}) => RouteSettings(name: name);

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: _route(name: LoginPage.routeName),
        );
      case SignUpPage.routeName:
        return MaterialPageRoute(
            builder: (_) => SignUpPage(),
            settings: _route(name: SignUpPage.routeName));
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
