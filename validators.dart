class Validators {
  static String? validateNotEmpty(String? value, String field) {
    if (value == null || value.trim().isEmpty) return '$field cannot be empty';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email cannot be empty';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }
}