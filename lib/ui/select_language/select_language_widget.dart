import 'package:flutter/material.dart';
import 'package:flutterstarterproject/generated/l10n.dart';
import 'package:flutterstarterproject/main_provider.dart';
import 'package:flutterstarterproject/ui/sample/sample_widget.dart';
import 'package:flutterstarterproject/utils/shared_widgets/animated_button.dart';
import 'package:flutterstarterproject/utils/style/theme.dart';
import 'package:provider/provider.dart';

class SelectLanguageWidget extends StatefulWidget {
  static const tag = "SelectLanguageWidget";

  @override
  _SelectLanguageWidgetState createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectLanguageWidget> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/blue_bg.png",),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(S.of(context).selectLanguage, style: Theme.of(context).textTheme.title,),
                Padding(
                  padding: const EdgeInsets.only(top:25.0, bottom: 10),
                  child: LanguageButton(
                    btnName: "English",
                    isSelected: selectedValue == ENGLISH_VALUE,
                    onPressed: (){
                      setState(() {
                        selectedValue = ENGLISH_VALUE;
                        Provider.of<MainProvider>(context, listen: false).updateApplicationLocale(S.delegate.supportedLocales[0]);
                      });
                    },
                  ),
                ),
                LanguageButton(
                  btnName: "عربي",
                  isSelected: selectedValue == ARABIC_VALUE,
                  onPressed: (){
                    setState(() {
                      selectedValue = ARABIC_VALUE;
                      Provider.of<MainProvider>(context, listen: false).updateApplicationLocale(S.delegate.supportedLocales[1]);
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: AnimatedButton(
                    isDisabled: (selectedValue != ARABIC_VALUE && selectedValue != ENGLISH_VALUE),
                    controller: AnimatedButtonController(),
                    btnName: S.of(context).select,
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SampleWidget(title: "",),
                      ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

class LanguageButton extends StatelessWidget {
  final Function onPressed;
  final String btnName;
  final bool isSelected;
  const LanguageButton({Key key, this.onPressed, this.btnName, this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: isSelected?
      FlatButton(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(child: Text(btnName, style: blueButtonTextStyle)),
        ),
        onPressed: onPressed,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      )
          :OutlineButton(
        color: Colors.white,
        borderSide: BorderSide(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(child: Text(btnName, style: Theme.of(context).textTheme.button)),
        ),
        onPressed: onPressed,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      )
    );
  }
}
const int ARABIC_VALUE  = 1;
const int ENGLISH_VALUE = 2;