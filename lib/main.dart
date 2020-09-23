import 'package:flutter/material.dart';
import 'file:///E:/android/projects/flutter-starter-project/lib/ui/sample/sample_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterstarterproject/generated/l10n.dart';
import 'package:flutterstarterproject/ui/select_language/select_language_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: SelectLanguageWidget(),
    );
  }
}
