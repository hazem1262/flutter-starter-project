import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterstarterproject/generated/l10n.dart';
import 'package:flutterstarterproject/main_provider.dart';
import 'package:flutterstarterproject/ui/select_language/select_language_widget.dart';
import 'package:flutterstarterproject/utils/navigation/navigation_helper.dart';
import 'package:flutterstarterproject/utils/style/theme.dart';
import 'package:get/get.dart';

void main() {
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
          title: "Flutter Demo",
          theme: appTheme,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialRoute: SelectLanguageWidget.tag,
          locale: Get.locale,
          getPages: applicationPages,
        );
      },
    );
  }
}
