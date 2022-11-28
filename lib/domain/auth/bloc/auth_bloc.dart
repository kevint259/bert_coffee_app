import 'dart:developer';

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
        emit(AuthStateLoggingIn(exception: e));
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
        final user = provider.currentUser;
        if (user == null) {
          emit(const AuthStateVerifyEmail());
        } else {
          if (user.isEmailVerified) {
            emit(const AuthStateLoggedIn());
          } else {
            emit(const AuthStateVerifyEmail());
          }
        }
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
        emit(state);
      }
    });

    // on the event the user verifies email
    on<AuthEventVerifyEmail>((event, emit) async {
      final user = provider.currentUser;
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

    // on event user forgets password
    on<AuthEventResetPassword>((event, emit) async {
      
    });

    // resend verification email

    // on event user presses SIGN IN WITH EMAIL
    on<AuthEventSignInWithEmail>((event, emit) {
      emit(const AuthStateLoggingIn(exception: null));
    });

    // on event user wants to register
    on<AuthEventShouldRegister>((event, emit) {
      emit(const AuthStateRegistering(exception: null));
    });
  }

}
