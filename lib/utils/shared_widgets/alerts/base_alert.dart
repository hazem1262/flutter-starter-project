import 'package:flutter/material.dart';
import 'package:flutterstarterproject/utils/style/theme.dart';

class BaseAlert extends StatelessWidget {
  const BaseAlert({
    Key key,
    this.title = '',
    this.body = '',
    this.buttonsWidget,
  }) : super(key: key);

  final String title;
  final String body;
  final Widget buttonsWidget;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.only(
            top: 36,
            bottom: 14,
            right: 13,
            left: 13,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: blueDefance,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 11),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: blueDefance,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              buttonsWidget ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
