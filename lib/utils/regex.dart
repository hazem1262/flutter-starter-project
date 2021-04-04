
abstract class Regex {
  Regex._();

// used for input formatters
  static RegExp get numbersEn => RegExp(r'[0-9]');
  static RegExp get alphanumericArEnSpace =>
      RegExp(r'[a-zA-Z\u0600-\u06FF\s0-9]');
  static RegExp get alphanumericArEn => RegExp(r'[a-zA-Z\u0600-\u06FF0-9]');
  static RegExp get alphanumericEn => RegExp(r'[a-zA-Z0-9]');
  static RegExp get password => RegExp(r'[a-zA-Z0-9]');

  // used for validation
  static RegExp get nameValidation =>
      RegExp(r'^[a-zA-Z\u0600-\u06FF\s0-9]{1,64}$');
  static RegExp get emailValidation => RegExp(
        r"^((([!#$%&'*+\-/=?^_`{|}~\w])|([!#$%&'*+\-/=?^_`{|}~\w][!#$%&'*+\-/=?^_`{|}~\.\w]{0,}[!#$%&'*+\-/=?^_`{|}~\w]))[@]\w+([-.]\w+)*\.\w+([-.]\w+)*)$",
        caseSensitive: false,
      );
  static RegExp get passwordValidation =>
      RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,}$');
}
