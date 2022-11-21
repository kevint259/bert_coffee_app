import 'package:bert_coffee/pages/home_screen/home_screen.dart';
import 'package:bert_coffee/pages/router/routes.dart';
import 'package:firebase_core/firebase_core.dart';
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
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Bert Coffee App",
    home: FutureBuilder(
      future: _fbApp,
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          print("WHAT WENT WRONG: ${snapshot.error.toString()}");
          return const Text("Something went wrong");
        } else if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      })),
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
