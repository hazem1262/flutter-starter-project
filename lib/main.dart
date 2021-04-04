import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterstarterproject/generated/l10n.dart';
import 'package:flutterstarterproject/main_provider.dart';
import 'package:flutterstarterproject/ui/select_language/select_language_widget.dart';
import 'package:flutterstarterproject/utils/constants.dart';
import 'package:flutterstarterproject/utils/navigation/navigation_helper.dart';
import 'package:flutterstarterproject/utils/services/internet_connection_service.dart';
import 'package:flutterstarterproject/utils/services/localization_service.dart';
import 'package:flutterstarterproject/utils/services/network_service.dart';
import 'package:flutterstarterproject/utils/services/shared_preferences_service.dart';
import 'package:flutterstarterproject/utils/style/theme.dart';
import 'package:get/get.dart';

void main() async{
  //https://stackoverflow.com/questions/63873338/what-does-widgetsflutterbinding-ensureinitialized-do
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => SharedPreferencesService.init(), permanent: true);
  Get.put(LocalizationService.init(), permanent: true);
  Get.put(NetworkService.init(), permanent: true);
  await Get.putAsync(() => InternetConnectionService.init(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainProvider>(
      init: MainProvider(),
      builder: (mainProvider){
        return GetMaterialApp(
          title: appTitle,
          theme: appTheme,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialRoute: SelectLanguageWidget.tag,
          locale: Get.find<LocalizationService>().currentLocale.locale,
          getPages: applicationPages,
        );
      },
    );
  }
}
