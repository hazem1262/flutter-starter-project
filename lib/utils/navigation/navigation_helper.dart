import 'package:flutter/material.dart';
import 'package:flutterstarterproject/ui/sample/sample_widget.dart';
import 'package:flutterstarterproject/ui/select_language/select_language_widget.dart';
Route getApplicationRoute(RouteSettings settings) {
  switch (settings.name){
    case SelectLanguageWidget.tag:
      return _buildRoute(settings, SelectLanguageWidget(), transitionTime: 800);

    case SampleWidget.tag:
      return _buildRoute(settings, SampleWidget(), transitionTime: 800);

    default:
      return null;
  }
}
PageRouteBuilder _buildRoute(RouteSettings settings, Widget page, {int transitionTime = 400, Offset transitionBegin = Offset.zero}){
  return new PageRouteBuilder(
      settings: settings,
      transitionDuration: Duration(milliseconds: transitionTime),
      pageBuilder: (BuildContext context, _, __) => page,
      transitionsBuilder: (_, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: transitionBegin,
              end: Offset.zero,
            ).animate(animation),
            child: child, // child is the value returned by pageBuilder
          ),
        );
      }
  );
}