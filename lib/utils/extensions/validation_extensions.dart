import 'package:flutterstarterproject/utils/regex.dart';

extension ValidationExtensions on String {
  bool get isValidEmail {
    return Regex.emailValidation.hasMatch(this);
  }

  bool get isValidPassword {
    return Regex.passwordValidation.hasMatch(this);
  }

  bool get isValidName {
    return Regex.nameValidation.hasMatch(this);
  }
}
