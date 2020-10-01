import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String APP_FIRST_OPEN = "APP_FIRST_OPEN";
const String APP_SAVED_LOCALE = "APP_SAVED_LOCALE";

Future<bool> isAppFirstOpen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(APP_FIRST_OPEN) ?? true;
}

void markAppAsOpenedBefore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(APP_FIRST_OPEN, false);
}

Future<String> getSelectedLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(APP_SAVED_LOCALE) ?? "";
}

void saveApplicationLocale(String savedLocale) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(APP_SAVED_LOCALE, savedLocale);
}