class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'weak-password':
        return 'Please Enter a stronger password.';

      case 'invalid-email':
        return 'The email adress provided is invalid. Please Enter a valid email.';

      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';

      case 'operation-not-allowed':
        return 'Operation is not allowed. Please contact support.';

      case 'user-disabled':
        return 'This user has been disabled. Please contact support for help.';

      case 'user-not-found':
        return 'Invalid login details. User not found.';

      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';

      case 'invalid-verification-code':
        return 'Incorrect verification code. Please enter a valid code.';

      case 'invalid-verification-id':
        return 'Incorrect verification ID. Please request a new verification id.';

      case 'email-already-exists':
        return 'The email address already exists. Please login.';

      case 'invalid-action-code':
        return 'The action code is invalid. Please request a new one.';

      case 'expired-action-code':
        return 'The action code has expired. Please request a new one.';

      case 'user-mismatch':
        return 'The provided credential does not match the previously signed-in user.';

      case 'invalid-credential':
        return 'The provided credential is malformed or has expired.';

      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials.';

      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';

      case 'provider-already-linked':
        return 'The account is already linked with another account on a different provider.';

      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';

      case 'invalid-api-key':
        return 'The provided API key is invalid.';

      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication.';

      case 'keychain-error':
        return 'A keychain error occurred.';

      case 'internal-error':
        return 'An internal error occurred. Please try again later.';

      default:
        return 'An unknown error occurred.';
    }
  }
}
