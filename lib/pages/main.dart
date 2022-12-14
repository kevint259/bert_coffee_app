import 'package:bert_coffee/domain/auth/auth_provider.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_bloc.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_event.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_state.dart';
import 'package:bert_coffee/firebase_options.dart';
import 'package:bert_coffee/pages/authentication/email_verify_screen.dart';
import 'package:bert_coffee/pages/authentication/login_screen.dart';
import 'package:bert_coffee/pages/authentication/register_screen.dart';
import 'package:bert_coffee/pages/coffee_nav/home_page.dart';
import 'package:bert_coffee/pages/default_home/default_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // ensures that UI
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // runs app
  runApp(
    MaterialApp(
      title: "Bert Coffee App",
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(AuthProvider()),
        child: const StateScreen(),
      ),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),),),
    ),
  );
}

// this decides which state the app will be in
class StateScreen extends StatelessWidget {
  const StateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const MainScreen();
        } else if (state is AuthStateVerifyEmail) {
          return const EmailVerifyScreen();
        } else if (state is AuthStateRegistering) {
          return const RegisterScreen();
        } else if (state is AuthStateLoggedOut) {
          return const DefaultHome();
        } else if (state is AuthStateLoggingIn) {
          return const LoginScreen();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
