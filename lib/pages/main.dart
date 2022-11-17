import 'package:bert_coffee/pages/home_screen/home_screen.dart';
import 'package:bert_coffee/pages/router/routes.dart';
import 'package:flutter/material.dart';

void main() {
  // initializes the appRouter for generated routing
  final AppRouter appRouter = AppRouter();

  WidgetsFlutterBinding.ensureInitialized;
  runApp(
      // ignore: prefer_const_constructors
      MaterialApp(
    title: "Bert Coffee App",
    home: const HomeScreen(),
    theme: ThemeData(primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white),
    onGenerateRoute: appRouter.onGenerateRoute,
  ));
}
