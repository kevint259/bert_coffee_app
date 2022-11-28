import 'package:flutter/material.dart';

Future<void> showResetPassword(
  BuildContext context,
  final String email,
) async {
  final _email = TextEditingController();
  return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text("Reset Password",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          elevation: 3,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // enter email quote
              const Text(
                "Enter the email address associated with your account",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // place to enter user's email address
              TextFormField(
                controller: _email,
              )
            ],
          ),
        );
      }));
}
