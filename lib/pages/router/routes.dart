
import 'package:bert_coffee/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {


  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}