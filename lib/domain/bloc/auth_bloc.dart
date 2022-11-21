
import 'dart:developer';

import 'package:bert_coffee/domain/auth_repository.dart';
import 'package:bert_coffee/domain/bloc/auth_event.dart';
import 'package:bert_coffee/domain/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(const AuthStateUninitialized()) {

    on<AuthEventLogIn>((event, emit) async {
      final email = event.email;
      final password = event.password;
      try {
        final user = 
        await authRepository.logIn(email: email, password: password);
        if ()
      } on Exception catch (e) {
        log(e.toString());
      }
    });
    
  }
}