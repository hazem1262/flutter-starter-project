import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterstarterproject/base/base_view.dart';
import 'package:flutterstarterproject/generated/l10n.dart';
import 'file:///E:/android/projects/flutter-starter-project/lib/main_provider.dart';
import 'package:flutterstarterproject/ui/select_language/select_language_widget.dart';
import 'package:flutterstarterproject/utils/navigation/navigation_helper.dart';
import 'package:flutterstarterproject/utils/style/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BaseView<MainProvider>(
      model: MainProvider(),
      builder: (context, mainProvider, _){
        return MaterialApp(
          title: "Flutter Demo",
          theme: appTheme,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: getApplicationRoute,
          initialRoute: SelectLanguageWidget.tag,
          locale: mainProvider.applicationLocale ?? Localizations.localeOf(context),
        );
      },
    );
  }
}
