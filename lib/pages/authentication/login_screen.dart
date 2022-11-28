import 'package:bert_coffee/domain/auth/auth_exceptions.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_bloc.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_event.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_state.dart';
import 'package:bert_coffee/pages/widgets/dialogs/error_dialog.dart';
import 'package:bert_coffee/pages/widgets/dialogs/reset_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLoggingIn) {
          if (state.exception is AuthWrongPasswordException) {
            return showErrorDialog(context, "Wrong password");
          } else if (state.exception is AuthInvalidEmailException) {
            return showErrorDialog(context, "Invalid Email");
          } else if (state.exception is AuthUserNotFoundException) {
            return showErrorDialog(context, "User Not Found");
          } else {
            return showErrorDialog(context, "Error Occurred");
          }
        } else if (state is AuthStateForgotPassword) {
          return showResetPassword(context);
        }
      },
      child: Scaffold(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: TextFormField(
                  controller: _password,
                  obscureText: true,
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

              // SIGN IN BUTTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 3,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 10)),
                child: Text(
                  "Login",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                  ),
                  maxLines: 1,
                ),
                onPressed: () {
                  final email = _email.text;
                  final password = _password.text;
                  context.read<AuthBloc>().add(AuthEventLogIn(email, password));
                },
              ),

              // SizedBox
              const SizedBox(height: 20),

              // Forgot Password?
              InkWell(
                onTap: () {
                  context.read<AuthBloc>().add(const AuthEventForgotPassword());
                },
                child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )
              )

              ),

              // Sizedbox
              const SizedBox(height: 30),

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
                            context
                                .read<AuthBloc>()
                                .add(const AuthEventShouldRegister());
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
                padding: const EdgeInsets.only(top: 140, left: 40, right: 40),
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
              )
            ],
          ),
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
