import 'dart:developer';

import 'package:bert_coffee/domain/auth_repository.dart';
import 'package:bert_coffee/domain/bloc/auth_event.dart';
import 'package:bert_coffee/domain/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(const AuthStateUninitialized()) {

    // on event of initializing app
    on<AuthEventInitialize>((event, emit) async {
      await authRepository.initialize();
      final user = authRepository.currentUser;
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
        final user =
            await authRepository.logIn(email: email, password: password);
        if (user.isEmailVerified) {
          emit(const AuthStateLoggedIn());
        } else {
          emit(const AuthStateVerifyEmail());
        }
      } on Exception catch (e) {
        log(e.toString());
      }
    });

    // on the event the user is created
    on<AuthEventRegister>((event, emit) async {
      final email = event.email;
      final password = event.password;
      final name = event.name;
      try {
        final user = await authRepository.registerUser(email: email, password: password);
        await authRepository.updateDisplayName(name: name);
        await authRepository.sendEmailVerification();
        if (user.isEmailVerified) {
          emit(const AuthStateLoggedIn());
        } else {
          emit(const AuthStateVerifyEmail());
        }
      } on Exception catch (e) {
        log(e.toString());
      }
    });


  }
}
