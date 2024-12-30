class AppValidator {
  static String? nameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Email tidak boleh kosong";
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Kata sandi harus setidaknya terdiri dari 6 karakter';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Passwords tidak cocok';
    }
    return null;
  }
}
