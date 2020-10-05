import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color mayaBlue = const Color(0xFF68baf4);
const Color blueDefance = const Color(0xFF3784e5);
const Color blueDefance25 = const Color(0x443784e5);
const Color blueDefance50 = const Color(0x883784e5);
const Color whiteSmoke = const Color(0xFFf5f5f5);
const Color ashGrey = const Color(0xFFb7b7b7);
const Color dimGrey = const Color(0xFF6c6c6c);
const Color coolGrey = const Color(0xFF8d92a3);
const Color manatee = const Color(0xFF969696);
const Color candyPink = const Color(0xFFec747c);
const Color darkMidNightBlue = const Color(0xFF1b3a5e);
const Color lavender = const Color(0xFFd4e6ff);
const Color ghostWhite = const Color(0xFFf9f9fb);
const Color whiteDisabled = const Color(0x88FFFFFF);
const Color gainsboro = const Color(0xFFd9d9d9);
const Color gainsboro25 = const Color(0x44d9d9d9);
const Color platinum = const Color(0xFFe5e5e5);
const Color forestGreen = const Color(0xFF2ba42f);
const Color lavander = const Color(0xFFdce3f1);
const Color orangeYellow = const Color(0xffffc55e);
const Color orangeRed = const Color(0xffFFD9DC);
const Color darkTangerne = const Color(0xffffaf1f);
const Color outerSpace = const Color(0xff474747);

const double ICON_SIZE = 18;
const blueGradient = LinearGradient(
    colors: [mayaBlue, blueDefance],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
);

const disabledGradient = LinearGradient(
  colors: [dimGrey, ashGrey],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter
);

final appTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: blueDefance,
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    caption: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 25,
    ),
    button: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 16
    ),
    bodyText1: TextStyle(
      color: ashGrey,
      fontSize: 14
    ),
    bodyText2: TextStyle(
      color: dimGrey,
      fontSize: 13
    ),
    headline1: TextStyle(
        color: dimGrey,
        fontSize: 16
    ),
    headline2: TextStyle(
      color: darkMidNightBlue,
      fontSize: 18,
      fontWeight: FontWeight.w700
    ),
    headline3: TextStyle(
      color: lavender,
      fontSize: 14
    ),
    headline4: TextStyle(
        color: lavender,
        fontSize: 14
    ),
    headline5: TextStyle(
        color: lavender,
        fontSize: 14
    ),
    headline6: TextStyle(
        color: lavender,
        fontSize: 14
    )
  )
);

const TextStyle errorTextStyle = TextStyle(
  color: candyPink,
  fontSize: 13,
);

const TextStyle whiteHeader = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 18
);

const TextStyle pinkText = TextStyle(
  color: candyPink,
  fontWeight: FontWeight.w900,
  fontSize: 18
);

const TextStyle whiteTitle = TextStyle(
    color: Colors.white,
    fontSize: 15
);

const TextStyle whiteTitleSemiBold = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

const TextStyle dimGreyTitle = TextStyle(
    color: dimGrey,
    fontSize: 15
);

const TextStyle expireTextStyle = TextStyle(
  color: candyPink,
  fontSize: 16,
);

const TextStyle nearExpireTextStyle = TextStyle(
  color: manatee,
  fontSize: 16,
);

const TextStyle slowMovingTextStyle = TextStyle(
  color: blueDefance,
  fontSize: 16,
);

const TextStyle blueDefance14TextStyle = TextStyle(
  color: blueDefance,
  fontSize: 14,
);

const TextStyle coolGreyTextStyle = TextStyle(
  color: coolGrey,
  fontSize: 14,
);

const TextStyle blueButtonTextStyle = TextStyle(
  color: blueDefance,
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

const TextStyle noteTextStyle = TextStyle(
  color: manatee,
  fontSize: 12,
);
const TextStyle manatee13TextStyle = TextStyle(
  color: manatee,
  fontSize: 12,
);
const TextStyle congratulationTextStyle = TextStyle(
  color: manatee,
  fontSize: 14,
);
const TextStyle dimGreySBTextStyle = TextStyle(
  color: dimGrey,
  fontSize: 16,
  fontWeight: FontWeight.w700
);

const TextStyle priceTextStyle = TextStyle(
  color: candyPink,
  fontSize: 16,
  fontWeight: FontWeight.w700
);

const slowTextStyle = TextStyle(
    color: ashGrey,
    fontSize: 12
);

const darkMidNightStyle = TextStyle(
  color: darkMidNightBlue,
  fontSize: 16,
);

const darkMidNightBoldStyle = TextStyle(
  color: darkMidNightBlue,
  fontSize: 14,
  fontWeight: FontWeight.w700
);

const darkMidNightSemiBoldStyle = TextStyle(
    color: darkMidNightBlue,
    fontSize: 16,
    fontWeight: FontWeight.w700
);

const darkMidNightBigSemiBoldStyle = TextStyle(
    color: darkMidNightBlue,
    fontSize: 22,
    fontWeight: FontWeight.w700
);

const bigTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 30
);

const TextStyle cartSBTextStyle = TextStyle(
    color: dimGrey,
    fontSize: 22,
    fontWeight: FontWeight.w700
);

const greenTextStyle = TextStyle(
    color: forestGreen,
    fontSize: 14
);

const blueTextStyle = TextStyle(
    color: blueDefance,
    fontSize: 14
);
const redTextStyle = TextStyle(
    color: Colors.red,
    fontSize: 14
);

const darkOrangeTextStyle = TextStyle(
    color: darkTangerne,
    fontSize: 14
);

const outerSpaceTextStyle = TextStyle(
    color: outerSpace,
    fontSize: 18
);