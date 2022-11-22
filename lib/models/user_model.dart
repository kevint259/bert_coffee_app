import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class AuthUser extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final bool isEmailVerified;

  const AuthUser(
    this.id,
    this.name,
    this.email,
    this.isEmailVerified,
  );
  
  @override
  List<Object?> get props => throw [id, name, email, isEmailVerified];

  // converts user --> authUser
  factory AuthUser.fromFirebase(User user) => AuthUser(
    user.uid, user.displayName, user.email, user.emailVerified,
  );
}
