import 'package:bert_coffee/domain/auth/bloc/auth_bloc.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> showResetPassword(
  BuildContext context,
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
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2)),
                  filled: true,
                  hintText: "Email Address",
                  fillColor: Colors.grey[300],
                ),
              )
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  // cancels the whole process
                  onPressed: () {
                    Navigator.of(context).pop();
                    _email.clear();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  // resets the entire email
                  onPressed: () {
                    final email = _email.text;
                    Navigator.of(context).pop();
                    context.read<AuthBloc>().add(AuthEventResetPassword(email));
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      }));
}
