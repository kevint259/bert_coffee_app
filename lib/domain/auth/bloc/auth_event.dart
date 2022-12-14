import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventLogIn extends AuthEvent {
  final String email;
  final String password;
  const AuthEventLogIn(this.email, this.password);
}

class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}

class AuthEventRegister extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const AuthEventRegister(this.name, this.email, this.password);
}

class AuthEventShouldRegister extends AuthEvent {
  const AuthEventShouldRegister();
}

class AuthEventVerifyEmail extends AuthEvent {
  const AuthEventVerifyEmail();
}

class AuthEventResetPassword extends AuthEvent {
  final String email;
  const AuthEventResetPassword(this.email);
}

class AuthEventSignInWithEmail extends AuthEvent {
  const AuthEventSignInWithEmail();
}

class AuthEventForgotPassword extends AuthEvent {
  const AuthEventForgotPassword();
}

class AuthEventResetLoginPage extends AuthEvent {
  const AuthEventResetLoginPage();
}

class AuthEventResendEmailVerification extends AuthEvent {
  const AuthEventResendEmailVerification();
}
