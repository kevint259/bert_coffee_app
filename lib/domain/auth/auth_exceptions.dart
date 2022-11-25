
// auth/email-already-in-use 
// Thrown if there already exists an account with the given email address.
class AuthEmailAlreadyInUseException implements Exception {}

// auth/invalid-email
// Thrown if the email address is not valid.
class AuthInvalidEmailException implements Exception {}

// auth/weak-password
// Thrown if the password is not strong enough.
class AuthWeakPasswordException implements Exception {}

// auth/user-not-found
// Thrown if there is no user corresponding to the given email.
class AuthUserNotFoundException implements Exception {}

// auth/wrong-password
// Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
class AuthWrongPasswordException implements Exception {}

// GENERIC EXCEPTION (everything else not on the top)
