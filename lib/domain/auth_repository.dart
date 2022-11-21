
import 'package:bert_coffee/domain/bloc/auth_state.dart';
import 'package:bert_coffee/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  // registers user
  Future<AuthUser> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw Exception("The password is too weak");
      } else if (e.code == "email-already-in-use") {
        throw Exception("The account already exists for that email");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // gets current user
  AuthUser? 

  // logs user in
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // logs user out
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  // gets user
  

}