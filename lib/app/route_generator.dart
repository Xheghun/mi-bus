import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myriad_bus_scheduler/core/error/route_exception.dart';
import 'package:myriad_bus_scheduler/feature/authentication/presentation/pages/login/login_page.dart';
import 'package:myriad_bus_scheduler/feature/authentication/presentation/pages/sign_up/sign_up_page.dart';

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
        throw RouteException();
    }
  }
}
