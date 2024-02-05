class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      // Firebase Authentication Exceptions (continued)

      case 'weak-password':
        return 'Please enter a stronger password.';

      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';

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
        return 'Incorrect verification ID. Please request a new verification ID.';

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

      // Other Firebase Exceptions
      case 'invalid-custom-token':
        return 'The custom token is invalid.';

      case 'custom-token-mismatch':
        return 'The custom token provided does not match the expected token.';

      case 'invalid-recipient-email':
        return 'The email address is not valid for password recovery.';

      case 'missing-iframe-start':
        return 'The start of the iframe was not found in the email action link.';

      case 'missing-ios-bundle-id':
        return 'The iOS bundle ID is missing in the Firebase config.';

      case 'missing-android-pkg-name':
        return 'The Android package name is missing in the Firebase config.';

      case 'missing-continue-uri':
        return 'The continue URL is missing in the action code settings.';

      case 'missing-phone-number':
        return 'The phone number is missing.';

      case 'missing-verification-id':
        return 'The verification ID is missing.';

      case 'missing-verification-code':
        return 'The verification code is missing.';

      // Firebase Cloud Messaging Exceptions
      case 'registration-token-not-registered':
        return 'The registration token is not registered.';

      case 'registration-token-appears-invalid':
        return 'The registration token appears to be invalid.';

      case 'messaging-service-unavailable':
        return 'The FCM service is currently unavailable.';

      case 'missing-device-id':
        return 'The device ID is missing.';

      case 'invalid-argument':
        return 'An invalid argument was provided.';

      // Firebase Realtime Database Exceptions
      case 'permission-denied':
        return 'Permission to access the resource was denied.';

      case 'data-stale':
        return 'The data is stale and needs to be refreshed.';

      case 'quota-exceeded':
        return 'The operation would exceed the data usage quota.';

      case 'transaction-aborted':
        return 'The transaction was aborted.';

      // Firebase Cloud Firestore Exceptions
      case 'aborted':
        return 'The operation was aborted.';

      case 'already-exists':
        return 'The document or resource already exists.';

      case 'cancelled':
        return 'The operation was cancelled.';

      case 'data-loss':
        return 'Unrecoverable data loss or corruption occurred.';

      case 'deadline-exceeded':
        return 'The operation exceeded a deadline.';

      // Firebase Storage Exceptions
      case 'bucket-not-found':
        return 'The specified Cloud Storage bucket does not exist.';

      case 'project-not-found':
        return 'The specified project does not exist.';

      case 'object-not-found':
        return 'The specified object or file does not exist.';

      case 'unauthenticated':
        return 'The user is not authenticated.';

      // Firebase Cloud Functions Exceptions
      case 'unavailable':
        return 'The function is currently unavailable.';

      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials';

      default:
        return 'An unknown Firebase error occurred. Please try again.';
    }
  }
}
