import 'package:meta/meta.dart';


abstract class Languages {
  Languages._();

  static const String arabic = 'العربية';
  static const String english = 'English';
}

const String appTitle = 'Flutter Starter Project';
const String fontFamily = 'Tajawal';
const String defaultDateFormatLocale = 'en';

const Duration mockDuration = Duration(seconds: 1);
const int requestTimeout = 100000; // 100 seconds
const bool logAPIRequests = true;
const int pageSize = 10;
const int INITIAL_PAGE = 0;
const String defaultCountryCode = 'SA';
const String defaultCountryDialCode = '+966';
const int otpLength = 4;
const List<String> allowedExtensions = <String>['jpg', 'pdf', 'png'];
enum InputTypes { simple, email, number, password, phone }

@immutable
abstract class Enum<T> {
  const Enum(this.value);
  final T value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) => other is Enum<T> && other.value == value;
}

class APIResponseCode extends Enum<int> {
  const APIResponseCode(int value) : super(value);

  static const APIResponseCode success = APIResponseCode(0);
  static const APIResponseCode failure = APIResponseCode(1);
  static const APIResponseCode userNotValidated = APIResponseCode(2);
}
