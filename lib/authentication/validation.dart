class Validation {
  static String? validateEmptyField(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(value) {
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(value) {
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateFullName(value) {
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Full Name should not contain numbers';
    }
    return null;
  }

  static String? validatePhoneNumber(value) {
    if (value.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Phone Number should not contain letters';
    }
    return null;
  }
}
