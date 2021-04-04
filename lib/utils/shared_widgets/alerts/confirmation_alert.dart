import 'package:flutter/material.dart';
import 'package:flutterstarterproject/utils/shared_widgets/alerts/base_alert.dart';
import 'package:flutterstarterproject/utils/shared_widgets/animated_button.dart';
import 'package:flutterstarterproject/utils/extensions/extensions.dart';

class ConfirmationAlert extends StatelessWidget {
  const ConfirmationAlert({
    Key key,
    this.title = '',
    this.body = '',
    @required this.confirmButtonTitle,
    @required this.cancelButtonTitle,
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  final String title;
  final String body;
  final String confirmButtonTitle;
  final String cancelButtonTitle;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return BaseAlert(
      title: title,
      body: body,
      buttonsWidget: Row(
        children: <Widget>[
          Expanded(
            child: AnimatedButton(
              btnName: confirmButtonTitle,
              onPressed: () {
                context.navigator.pop(true);
                onConfirm?.call();
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: AnimatedButton(
              btnName: cancelButtonTitle,
              onPressed: () {
                context.navigator.pop(false);
                onCancel?.call();
              },
            ),
          ),
        ],
      ),
    );
  }
}
