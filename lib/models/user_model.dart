import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class AuthUser extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final bool isEmailVerified;
  final Future<void> reload;

  const AuthUser(
    this.id,
    this.name,
    this.email,
    this.isEmailVerified,
    this.reload,
  );

  @override
  List<Object?> get props => throw [id, name, email, isEmailVerified];

  // converts user --> authUserw
  factory AuthUser.fromFirebase(User user) => AuthUser(
        user.uid,
        user.displayName,
        user.email,
        user.emailVerified,
        user.reload(),
      );
}
