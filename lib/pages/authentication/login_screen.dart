import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
                child: Text(
              "WELCOME BACK!",
              style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
            )),
            Text(
              "Login here. ",
              style: GoogleFonts.acme(
               fontSize: 30, 
              )
            ),
            // sized box
            const SizedBox(height: 20,),
            // texteditingcontroller (EMAIL)
          ],
        ),
      ),
    );
  }
}
