import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/ui/screens/auth/forgot_pass/forgot_password_page.dart';
import 'package:myriad_bus_scheduler/ui/screens/home/home_screen.dart';
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

      case ForgotPasswordPage.routeName:
        return MaterialPageRoute(
            builder: (_) => ForgotPasswordPage(),
            settings: _route(name: ForgotPasswordPage.routeName));
      case HomeScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(),
            settings: _route(name: HomeScreen.routeName));
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
