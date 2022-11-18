
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Center(
                child: Text(
              "HELLO THERE!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )),
            Text("Register here. ",
                style: GoogleFonts.aBeeZee(
                  fontSize: 30,
                )),
            // sized box
            const SizedBox(
              height: 30,
            ),

            // name text field
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: TextFormField(
                controller: _name,
                obscureText: false,
                autocorrect: false,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Full Name",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    prefixIcon: const Icon(Icons.mood)),
                maxLines: 1,
              ),
            ),
            // email text field
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: TextFormField(
                controller: _email,
                obscureText: false,
                autocorrect: false,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Email Address",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    prefixIcon: const Icon(Icons.email)),
                maxLines: 1,
              ),
            ),
            // password text_field
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: TextFormField(
                controller: _password,
                obscureText: false,
                autocorrect: false,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    prefixIcon: const Icon(Icons.lock)),
                maxLines: 1,
              ),
            ),
            // sizedBox
            const SizedBox(height: 20),
            // SIGN UP BUTTON
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
              child: Text(
                "Sign Up",
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                ),
                maxLines: 1,
              ),
            ),
            // SizedBox
            const SizedBox(height: 20),
            // Not a member? Register Here.
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Login Here.",
                    recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}