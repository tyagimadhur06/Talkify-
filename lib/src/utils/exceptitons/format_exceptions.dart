class TFormatException implements Exception {
  final String message;

  const TFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException(
            'The email address format is invalid. Please enter a valid email.');

      case 'invalid-phone-number-format':
        return const TFormatException(
            'The phone number format is invalid. Please enter a valid Phone number.');

      default:
        return const TFormatException(
            'Unexpected format exception occurred.Please try again.');
    }
  }
}
