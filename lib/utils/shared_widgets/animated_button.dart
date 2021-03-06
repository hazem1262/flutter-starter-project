import 'package:flutter/material.dart';
import 'package:flutterstarterproject/utils/style/theme.dart';
import 'package:get/get.dart';

class AnimatedButton extends StatelessWidget {
  final Function onPressed;
  final String btnName;
  final AnimatedButtonController controller;
  final bool isDisabled;

  const AnimatedButton({Key key, this.onPressed, this.btnName, this.controller, this.isDisabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimatedButtonController>(
      init: controller,
      builder: (animatedController){
        return AnimatedContainer(
          duration: Duration(milliseconds: ANIMATION_DURATION),
          height: 50,
          width: controller.width,
          child: RaisedButton(
            disabledColor: whiteSmoke,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(0.0),
            onPressed: isDisabled ? null : onPressed,
            child: Ink(
              decoration: BoxDecoration(
                gradient: isDisabled ? disabledGradient : blueGradient,
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
              ),
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: <Widget>[
                  AnimatedOpacity(
                      opacity: controller.showLoading ? 0 : 1,
                      duration: Duration(milliseconds: ANIMATION_DURATION),
                      child: Center(child: Text(btnName, style: Theme.of(context).textTheme.button))),
                  AnimatedOpacity(
                      opacity: controller.showLoading ? 1 : 0,
                      duration:Duration(milliseconds: ANIMATION_DURATION),child: Center(child: CircularProgressIndicator(backgroundColor: Colors.white,))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}

const int ANIMATION_DURATION = 500;
class AnimatedButtonController extends GetxController {
  double width = 500;
  bool showLoading = false;

  void startAnimation(){
    width = 50;
    showLoading = true;
    update();
  }

  void reverseAnimation(){
    width = 500;
    showLoading = false;
    update();
  }

}