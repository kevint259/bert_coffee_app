import 'package:flutter/material.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

// waiting to see if user is authenticated or not on app start
class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized();
}

class AuthStateLoggedIn extends AuthState {
  const AuthStateLoggedIn();
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();
}

class AuthStateLoggingIn extends AuthState {
  final Exception? exception;
  const AuthStateLoggingIn({required this.exception});
}

class AuthStateRegistering extends AuthState {
  final Exception? exception;
  const AuthStateRegistering({required this.exception});
}

class AuthStateVerifyEmail extends AuthState {
  const AuthStateVerifyEmail();
}

class AuthStateForgotPassword extends AuthState {
  const AuthStateForgotPassword();
}
