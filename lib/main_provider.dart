import 'package:flutter/material.dart';
import 'package:flutterstarterproject/data/local/shared_preference_utils.dart';
import 'package:flutterstarterproject/generated/l10n.dart';
import 'package:get/get.dart';

class MainProvider extends GetxController{
  Locale applicationLocale = Get.locale;

  MainProvider(){
    loadSavedLocale();
  }

  updateApplicationLocale(Locale newLocale){
    if(newLocale != applicationLocale){
      saveApplicationLocale(newLocale.languageCode);
      applicationLocale = newLocale;
      Get.updateLocale(newLocale);
      update();
    }
  }

  void loadSavedLocale() async{
    String languageCode = await getSelectedLocale();
    Locale savedLocale = S.delegate.supportedLocales.firstWhere((locale) => locale.languageCode == languageCode);
    if(savedLocale != null){
      updateApplicationLocale(savedLocale);
    }
  }
}