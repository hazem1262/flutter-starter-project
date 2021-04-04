import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterstarterproject/utils/extensions/extensions.dart';

abstract class SharedPreferencesKeys {
  SharedPreferencesKeys._();

  static const String token = 'token';
  static const String tokenExpiryDate = 'tokenExpiryDate';
  static const String currentLocale = 'currentLocale';
}

class SharedPreferencesService extends GetxService {
  SharedPreferencesService._(this._prefs);

  final SharedPreferences _prefs;

  static Future<SharedPreferencesService> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return SharedPreferencesService._(prefs);
  }

  String get token {
    return _prefs.getString(SharedPreferencesKeys.token);
  }

  set token(String token) {
    _prefs.setString(SharedPreferencesKeys.token, token);
  }

  DateTime get tokenExpiryDate {
    final String dateString =
        _prefs.getString(SharedPreferencesKeys.tokenExpiryDate);
    if (!dateString.isNullOrEmpty) {
      return DateTime.parse(dateString);
    } else {
      return null;
    }
  }

  set tokenExpiryDate(DateTime tokenExpiryDate) {
    _prefs.setString(
      SharedPreferencesKeys.tokenExpiryDate,
      tokenExpiryDate.toIso8601String(),
    );
  }

  String get currentLocale {
    return _prefs.getString(SharedPreferencesKeys.currentLocale);
  }

  set currentLocale(String currentLocale) {
    _prefs.setString(SharedPreferencesKeys.currentLocale, currentLocale);
  }
}
