// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginTextButton extends StatelessWidget {
  Color backgroundColor;
  Color shadowColor;
  Function loginButton;
  String loginText;
  Icon loginIcon;

  LoginTextButton({
    Key? key,
    required this.backgroundColor,
    required this.shadowColor,
    required this.loginButton,
    required this.loginText,
    required this.loginIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: loginIcon,
      onPressed: loginButton(),
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 3,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 80,
        ),
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      label: Text(
        loginText,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
