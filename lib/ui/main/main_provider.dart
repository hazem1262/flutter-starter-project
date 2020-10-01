import 'package:flutter/material.dart';
import 'package:flutterstarterproject/data/local/shared_preference_utils.dart';
import 'package:flutterstarterproject/generated/l10n.dart';

class MainProvider extends ChangeNotifier{
  Locale applicationLocale = S.delegate.supportedLocales[0];

  MainProvider(){
    loadSavedLocale();
  }

  updateApplicationLocale(Locale newLocale){
    if(newLocale != applicationLocale){
      saveApplicationLocale(newLocale.languageCode);
      applicationLocale = newLocale;
      notifyListeners();
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