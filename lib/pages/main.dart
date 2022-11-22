import 'package:bert_coffee/pages/home_screen/home_screen.dart';
import 'package:bert_coffee/pages/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  // ensures that UI 
  WidgetsFlutterBinding.ensureInitialized();
  // runs app 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // initializes the appRouter for generated routing
  final AppRouter appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Bert Coffee App",
    home: const HomeScreen(),
    theme: ThemeData(primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      )
    )),
    onGenerateRoute: appRouter.onGenerateRoute,
  );
  }
}
