import 'package:bert_coffee/domain/auth/auth_provider.dart';
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
      builder: ((context2) {
        return BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(AuthProvider()),
          child: AlertDialog(
            title: const Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // enter email quote
                const Text(
                  textAlign: TextAlign.center,
                  "You will receive a reset password email, if the email exists",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // Sized Box
                const SizedBox(
                  height: 20,
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
                      context
                          .read<AuthBloc>()
                          .add(const AuthEventResetLoginPage());
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
                      context
                          .read<AuthBloc>()
                          .add(AuthEventResetPassword(email));
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
          ),
        );
      }));
}
