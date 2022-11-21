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

class AuthStateRegistering extends AuthState {
  const AuthStateRegistering();
}

class AuthStateVerifyEmail extends AuthState {
  const AuthStateVerifyEmail();
}
