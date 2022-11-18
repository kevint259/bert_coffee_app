
import 'package:bert_coffee/pages/authentication/login_screen.dart';
import 'package:bert_coffee/pages/authentication/register_screen.dart';
import 'package:bert_coffee/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {


  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register': 
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return null;
    }
  }
}