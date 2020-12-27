import 'package:flutter/material.dart';
import 'package:flutterstarterproject/ui/sample/sample_widget.dart';
import 'package:flutterstarterproject/ui/select_language/select_language_widget.dart';
import 'package:get/get.dart';

List<GetPage> applicationPages = [
  GetPage(
    name: SelectLanguageWidget.tag,
    page: () => SelectLanguageWidget(),
  ),
  GetPage(
    name: SampleWidget.tag,
    page: () => SampleWidget(),
  ),
];