import 'package:bert_coffee/constants/routes.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_bloc.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_event.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class DefaultHome extends StatefulWidget {
  const DefaultHome({super.key});

  @override
  State<DefaultHome> createState() => _DefaultHomeState();
}

class _DefaultHomeState extends State<DefaultHome> {
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
            height: 180,
          ),
          // sign up using email text button
          SignInButton(
            Buttons.Email,
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEventSignInWithEmail());
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 14,
            ),
            elevation: 3,
          ),
          // sized box
          const SizedBox(
            height: 15,
          ),
          // login with gmail
          SignInButton(
            Buttons.Google,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            elevation: 3,
          ),
          const SizedBox(
            height: 15,
          ),
          // login with gmail
          SignInButton(
            Buttons.Apple,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 12,
            ),
            elevation: 3,
          ),
          // sizedbox
          const SizedBox(height: 30),
          // already have an account, sign in?
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).pushNamed(registerRoute),
                    text: " Register Here.",
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
