import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        // sized box
        const SizedBox(height: 100),
        // Verify email text
        Text(
          "Verify your email",
          style: GoogleFonts.aBeeZee(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        // check email text
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Check your email & click the link to activate account!",
            style: GoogleFonts.aBeeZee(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        // verify email logo
        Image.asset('assets/images/verify_email_logo.png'),
        // resend link
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              elevation: 3,
              padding:
                  const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10)),
          child: const Text("Resend Email Verification"),
        )
      ],
    )));
  }
}
