class SignUpEmailPasswordFailure {
  final String message;

  const SignUpEmailPasswordFailure([this.message = "An unkown error occured"]);

  factory SignUpEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpEmailPasswordFailure('Please Enter a stronger password');

      case 'invalid-email':
        return SignUpEmailPasswordFailure('Please Enter a valid email');
      
      case 'email-already-in-use':
        return SignUpEmailPasswordFailure('An account already exists for that email');

      case 'operation-not-allowed':
        return SignUpEmailPasswordFailure('Operation is not allowed. Please contact support.');
      
      case 'user-disabled':
        return SignUpEmailPasswordFailure('This user has been disabled. Please contact support for help');

      default:
        return SignUpEmailPasswordFailure();
    }
  }
}
