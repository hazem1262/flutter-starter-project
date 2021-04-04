import 'package:flutter/material.dart';

import 'package:flutterstarterproject/utils/style/theme.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key key,
    this.color = blueDefance,
  }) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
