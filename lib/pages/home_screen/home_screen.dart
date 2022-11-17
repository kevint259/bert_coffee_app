import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // logo on top
          Image.asset(
            'assets/images/bert_logo.png',
          ),
          // sized box
          const SizedBox(
            height: 40,
          ),
          // sign up using email text button
          ElevatedButton(
            onPressed: () {},
            child: const Text("Sign up using email"),
          )
        ],
      )),
    );
  }
}
