import 'package:meta/meta.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const String initial = '/';
  static const String register = '/register';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String profile = '/profile';
  static const String experience = '/experience';
  static const String forgotPassword = '/forgotPassword';
  static const String resetPassword = '/resetPassword';
  static const String home = '/home';
  static const String searchJobs = '/searchJobs';
  static const String filterJobs = '/filterJobs';
  static const String jobDetails = '/jobDetails';
}

abstract class URLs {
  URLs._();

  static const String protocol = 'https';
  static const String domain = 'jobs-api.10degrees.io';
  static const String api = 'api';
  static String get baseApi => '$protocol://$domain/$api';
  static String get baseUrl => '$protocol://$domain/';

  static const String login = 'Auth/EmployeeLogin';
  static const String register = 'Auth/RegisterEmployee';
  static const String verifyAccountOTP = 'Auth/VerifyAccountOTP';
  static const String resendVerifyAccountOTP = 'Auth/RequestVerifyAccountOTP';
  static const String forgotPassword = 'Auth/ForgotPasswordOTP';
  static const String verifyResetPasswordOTP = 'Auth/VerifyResetPasswordOTP';
  static const String resetPassword = 'Auth/ResetPassword';
  static const String getAvailableCountries = 'Lookup/GetCountries';
  static const String getAvailableSpecialities = 'Lookup/GetSpecialties';
  static const String getAvailablePlaces = 'Lookup/SearchPlaces';
  static const String getCountryCities = 'Lookup/GetCities';
  static const String getAttachments = 'Lookup/GetAttachmentType';
  static const String getProfileData = 'Employees/Profile';
  static const String editProfile = 'Employees/EditProfile';
  static const String uploadFile = 'Uploads/Upload';
  static const String jobs = 'Jobs';
  static const String jobsSearch = 'Jobs/Search';
  static const String favoriteJobs = 'Jobs/GetFavoriteJob';
  static const String addToFavoriteJobs = 'Jobs/AddFavoriteJob';
  static const String removeFromFavoriteJobs = 'Jobs/RemoveFavoriteJob';
  static const String companiesJobsSummary = 'Lookup/GetJobCompanySummary';
  static const String specialitiesJobsSummary = 'Lookup/GetSpecialtySummary';
}

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
