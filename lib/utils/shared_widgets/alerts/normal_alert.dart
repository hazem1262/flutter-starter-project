import 'package:flutter/material.dart';
import 'package:flutterstarterproject/utils/shared_widgets/alerts/base_alert.dart';
import 'package:flutterstarterproject/utils/extensions/extensions.dart';
import 'package:flutterstarterproject/utils/shared_widgets/animated_button.dart';

class NormalAlert extends StatelessWidget {
  const NormalAlert({
    Key key,
    this.title = '',
    this.body = '',
    @required this.buttonTitle,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String body;
  final String buttonTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseAlert(
      title: title,
      body: body,
      buttonsWidget: AnimatedButton(
        btnName: buttonTitle,
        onPressed: () {
          onPressed?.call();
          context.navigator.pop(true);
        },
      ),
    );
  }
}
