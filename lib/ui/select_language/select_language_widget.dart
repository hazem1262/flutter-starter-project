import 'package:dawa_masr/application.dart';
import 'package:dawa_masr/locale/my_localization.dart';
import 'package:dawa_masr/shared_widgets/animatedButton.dart';
import 'package:dawa_masr/ui/onBoarding/on_boarding1.dart';
import 'package:dawa_masr/utils/locale_dao.dart';
import 'package:dawa_masr/utils/theme.dart';
import 'package:flutter/material.dart';

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
            image: AssetImage("assets/images/sign_in_bg.png",),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(MyLocalization.of(context).trans("select_language"), style: Theme.of(context).textTheme.title,),
                Padding(
                  padding: const EdgeInsets.only(top:25.0, bottom: 10),
                  child: LanguageButton(
                    btnName: "English",
                    isSelected: selectedValue == ENGLISH_VALUE,
                    onPressed: (){
                      setState(() {
                        selectedValue = ENGLISH_VALUE;
                        LocaleDao().writeLocale("en");
                        application.setLocale(new Locale("en"));
                        application.onLocaleChanged(Locale("en"));
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
                      LocaleDao().writeLocale("ar");
                      application.setLocale(new Locale("ar"));
                      application.onLocaleChanged(Locale("ar"));
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: AnimatedButton(
                    isDisabled: (selectedValue != ARABIC_VALUE && selectedValue != ENGLISH_VALUE),
                    controller: AnimatedButtonController(),
                    btnName: MyLocalization.of(context).trans("select"),
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed(ObBoarding1.tag);
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