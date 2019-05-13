class PasswordValidator {
  String password;
  String error;

  PasswordValidator(String password) {
    this.password = password;
  }

  bool isPasswordStrong() {
    if (_isEmpty()) return _error("密码不能为空");
    if (!_isLengthEnough()) return _error("密码长度至少为10位");
    if (!_hasUpperCase()) return _error("密码需要包含大写字母");
    if (!_hasLowerCase()) return _error("密码需要包含小写字母");
    if (!_hasDigits()) return _error("密码需要包含数字");
    return true;
  }

  bool _error(String msg) {
    error = msg;
    return false;
  }

  static final upperCaseLetters = new RegExp("[A-Z]");
  static final lowerCaseLetters = new RegExp("[a-z]");
  static final digits = new RegExp("[0-9]");

  bool _isEmpty() {
    return password == null || password.isEmpty;
  }

  bool _isLengthEnough() {
    return password.length >= 10;
  }

  bool _hasUpperCase() {
    return password.contains(upperCaseLetters);
  }

  bool _hasLowerCase() {
    return password.contains(lowerCaseLetters);
  }

  bool _hasDigits() {
    return password.contains(digits);
  }
}
