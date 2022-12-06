import 'package:flutter/material.dart';

// Colors
Color bgColor = Color(0xff000b06);
Color shadowColor = Color(0xff2e3d38);
Color cardColor = Color(0xff06291d);
Color lightCardColor = Color(0xff209f6e);
Color mainTextColor = Color(0xfffcfcfc);
Color subTextColor = Color(0xffe1ece9);
Color iconColor = Color(0xff139c72);
Color buttonColor = Color(0xff1da16e);
Color primeColor = Color(0xff33c296);
Color errorMessageBG = Color(0xda9f5520);
Color telegramColor = Color(0xff259cd8);

// Strings
String title = 'ބަކުރުބޭގެ ޤުރްއާން ތަރުޖަމާ';
String ayai = 'އާޔަތް';
String ijmaalee = 'އިޖްމާލީ މާނަ';
String lafzee = 'ލަފްޒީ މާނަ';

/* Edge inset values*/
EdgeInsets cardShowInsets = const EdgeInsets.symmetric(
  vertical: 15.0,
  horizontal: 25.0,
);

const dropDownNumberTextStyle = TextStyle(
  fontFamily: 'Typewriter',
  color: Colors.white,
  fontSize: 15,
);

//Text styles
const ayahTextStyle = TextStyle(
  fontFamily: 'Uthmanic',
  color: Color(0xffe1ece9),
  fontSize: 26.0,
);

TextStyle translationTextStyle = TextStyle(
  fontFamily: 'Typewriter',
  color: mainTextColor,
  fontSize: 16.0,
);

const pageTitleStyle = TextStyle(
  fontFamily: 'Arslan',
  fontWeight: FontWeight.w800,
  fontSize: 25.0,
);

TextStyle surahListStyle = TextStyle(
  fontFamily: 'Uthmanic',
  color: subTextColor,
  fontSize: 20.0,
);

const snackTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Typewriter',
  fontSize: 17,
);

ShapeBorder snackShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));

SnackBar snackBar = SnackBar(
  backgroundColor: errorMessageBG,
  behavior: SnackBarBehavior.floating,
  shape: snackShape,
  content: const Text(
    "ރަނގަޅު އާޔަތެއް އިޚްތިޔާރުކުރައްވާ!",
    style: snackTextStyle,
  ),
);
