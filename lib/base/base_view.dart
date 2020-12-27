import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseView<T extends GetxController> extends StatelessWidget {
  final Widget Function(T value) builder;
  final T model;
  const BaseView({Key key, this.builder, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: model,
      builder: builder
    );
  }
}
