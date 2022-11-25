import 'package:bert_coffee/domain/auth/bloc/auth_bloc.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SafeArea(
                child: Column(
      children: [
        const Text(
          "WELCOME TO THIS PAGE",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 30),

        // logout button
        ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(const AuthEventLogOut());
          },
          child: const Text(
            "Logout",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ))));
  }
}
