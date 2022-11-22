import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Center(
                child: Text(
              "WELCOME BACK!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )),
            Text("Login here. ",
                style: GoogleFonts.aBeeZee(
                  fontSize: 30,
                )),
            // sized box
            const SizedBox(
              height: 30,
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
              child: Text(
                "Login",
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                ),
                maxLines: 1,
              ),
            ),
            // SizedBox
            const SizedBox(height: 20),
            // Forgot Password?
            const Text("Forgot Password?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )),
            // Sizedbox
            const SizedBox(height:30),
            // Not yet a member? Register Here.
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Not yet a member? ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: "Register Here.",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed('/register');
                        },
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))
                ],
              ),
            ),
            // Terms and Conditions
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Center(
                child: RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: "By clicking sign up you agree to our ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                      ),
                    ),
                    TextSpan(
                      text: "Terms and Conditions and Privacy Policy.",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              // take the customer to another page which shows the Terms and Conditions
                            },
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 11,
                      ),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // important to dispose if you're no longer using it anymore
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
