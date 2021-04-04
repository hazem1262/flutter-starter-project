import 'package:flutter/cupertino.dart';
import 'package:flutterstarterproject/utils/constants.dart';
import 'package:flutterstarterproject/utils/services/localization_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  bool get isNullOrEmpty {
    return this == null || isEmpty;
  }

  bool get isNotBlank {
    return trim().isNotEmpty;
  }

  bool get isNumbers {
    try {
      int.tryParse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  String get addBaseUrl {
    return '${URLs.baseUrl}$this';
  }

  String formatDate({String sourceFormat, String outPutFormat}) {
    final DateTime dateTime = DateTime.parse(this);
    return DateFormat(outPutFormat).format(dateTime);
  }
}

String getLocalizedString({@required String arabicString, @required String englishString}){
  return Get.find<LocalizationService>().currentLocale == AppLocale.arabic ? arabicString: englishString;
}