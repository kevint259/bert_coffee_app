
import 'package:bert_coffee/pages/authentication/email_verify_screen.dart';
import 'package:bert_coffee/pages/authentication/login_screen.dart';
import 'package:bert_coffee/pages/authentication/register_screen.dart';
import 'package:bert_coffee/pages/default_home/default_home.dart';
import 'package:flutter/material.dart';

class AppRouter {


  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const DefaultHome());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register': 
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case 'verifyEmail':
        return MaterialPageRoute(builder: (_) => const EmailVerifyScreen());
      default:
        return null;
    }
  }
}