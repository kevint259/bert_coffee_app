import 'package:bert_coffee/domain/auth/auth_exceptions.dart';
import 'package:bert_coffee/firebase_options.dart';
import 'package:bert_coffee/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthProvider {
  final _firebaseAuth = FirebaseAuth.instance;

  // initializes app 
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  // registers user
  Future<AuthUser> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else  {
        throw Exception("oh no");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        throw AuthInvalidEmailException();
      } else if (e.code == "email-already-in-use") {
        throw AuthEmailAlreadyInUseException();
      } else if (e.code == "weak-password") {
        throw AuthWeakPasswordException();
      } else {
        throw GenericAuthException();
      }
    } 
  }

  // logs user in
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw Exception("user does not exist");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        throw AuthInvalidEmailException();
      } else if (e.code == "user-not-found") {
        throw AuthUserNotFoundException();
      } else if (e.code == "wrong-password") {
        throw AuthWrongPasswordException();
      } else {
        throw GenericAuthException();
      }
    }
  }

  // logs user out
  Future<void> logOut() async {
    final user = currentUser;
    if (user != null) {
      await _firebaseAuth.signOut();
    } else {
      throw Exception("User Not Logged In");
    }
  }

  // gets current user (converts user --> AuthUser)
  AuthUser? get currentUser {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  // updates user's display name
  Future<void> updateDisplayName({
    required String name,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.updateDisplayName(name);
    } else {
      throw Exception("User Not Logged in");
    }
  }

  // send email verification
  Future<void> sendEmailVerification() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw Exception("No email :(");
    }
  }

  // forgot password


}
