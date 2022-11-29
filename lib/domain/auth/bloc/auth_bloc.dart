import 'dart:developer';

import 'package:bert_coffee/domain/auth/auth_exceptions.dart';
import 'package:bert_coffee/domain/auth/auth_provider.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_event.dart';
import 'package:bert_coffee/domain/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider) : super(const AuthStateUninitialized()) {

    // on event of initializing app
    on<AuthEventInitialize>((event, emit) async {
      await provider.initialize();
      final user = provider.currentUser;
      if (user == null) {
        emit(const AuthStateLoggedOut());
      } else {
        if (user.isEmailVerified) {
          emit(const AuthStateLoggedIn());
        } else {
          emit(const AuthStateVerifyEmail());
        }
      }
    });

    // on the event the login button is being pressed
    on<AuthEventLogIn>((event, emit) async {
      final email = event.email;
      final password = event.password;
      try {
        final user = await provider.logIn(
          email: email,
          password: password,
        );
        if (user.isEmailVerified) {
          emit(const AuthStateLoggedIn());
        } else {
          emit(const AuthStateVerifyEmail());
        }
      } on Exception catch (e) {
        emit(AuthStateLoggingIn(exception: e, forgotPassword: false));
      }
    });

    // on the event the user is created
    on<AuthEventRegister>((event, emit) async {
      final email = event.email;
      final password = event.password;
      final name = event.name;
      try {
        await provider.registerUser(email: email, password: password);
        await provider.updateDisplayName(name: name);
        await provider.sendEmailVerification();
        emit(const AuthStateVerifyEmail());
      } on Exception catch (e) {
        emit(AuthStateRegistering(exception: e));
      }
    });

    // on the event that the user is logged out
    on<AuthEventLogOut>((event, emit) async {
      try {
        await provider.logOut();
        emit(const AuthStateLoggedOut());
      } on Exception catch (e) {
        log(e.toString());
        emit(const AuthStateLoggedOut());
      }
    });

    // on the event the user verifies email
    on<AuthEventVerifyEmail>((event, emit) async {
      final user = provider.currentUser;
      await user?.reload;
      if (user != null) {
        if (user.isEmailVerified) {
          emit(const AuthStateLoggedIn());
        } else {
          emit(state);
        }
      } else {
        emit(const AuthStateLoggedOut());
      }
    });

    // on event user submits the forget password dialog
    on<AuthEventResetPassword>((event, emit) async {
      try {
        final email = event.email;
        await provider.resetPassword(email: email);
        emit(const AuthStateLoggingIn(exception: null, forgotPassword: false));
      } on Exception catch (e) {
        emit(AuthStateLoggingIn(exception: e, forgotPassword: false));
      }
    });
    
    // on event that user presses the Forgot Password button
    on<AuthEventForgotPassword>((event, emit) {
      emit(const AuthStateLoggingIn(forgotPassword: true, exception: null));
    });

    // resets login page after clicking "cancel" on reset password
    on<AuthEventResetLoginPage>((event, emit) {
      emit(const AuthStateLoggingIn(forgotPassword: false, exception: null));
    });

    // on event user presses SIGN IN WITH EMAIL
    on<AuthEventSignInWithEmail>((event, emit) {
      emit(const AuthStateLoggingIn(exception: null, forgotPassword: false));
    });

    // on event user wants to register
    on<AuthEventShouldRegister>((event, emit) {
      emit(const AuthStateRegistering(exception: null));
    });

     // resend verification email
     on<AuthEventResendEmailVerification>((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
     });

  }
} 
