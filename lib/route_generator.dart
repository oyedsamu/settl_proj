import 'package:flutter/material.dart';
import 'package:settl_proj/presentation/homepage.dart';
import 'package:settl_proj/presentation/sign_in_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/signIn":
        return MaterialPageRoute(builder: (_) => UserSignInPage());
      case "/homepage":
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
