import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

ThemeData theme = ThemeData(
  fontFamily: 'Sofia',
  primarySwatch: materialCeleste,
);

const TextStyle titleStyle = TextStyle(
  fontFamily: 'Amsterdam',
  fontSize: 38.0,
  height: 1.4,
  color: verdeAzul,
);

const TextStyle subtitleStyle = TextStyle(
  fontFamily: 'Baskerville',
  fontSize: 16.0,
  color: verdeAzul,
  fontWeight: FontWeight.bold,
  letterSpacing: 8.0,
);

PreferredSize bottomAppBar = PreferredSize(
  child: Padding(
    padding: const EdgeInsets.fromLTRB(80.0, 20.0, 80.0, 16.0),
    child: RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'Claudia Oropeza',
          style: titleStyle,
          children: <TextSpan>[
            TextSpan(
              text: '\nPHOTOGRAPHY',
              style: subtitleStyle,
            ),
          ]),
    ),
  ),
  preferredSize: const Size(0.0, 50.0),
);

MaterialColor materialCeleste = createMaterialColor(celeste);
MaterialColor materialVerdeAzul = createMaterialColor(verdeAzul);
MaterialColor materialGris = createMaterialColor(gris);
MaterialColor materialCafe = createMaterialColor(cafe);
MaterialColor materialRosa = createMaterialColor(rosa);
const Color celeste = Color(0xFF9EBCBE);
const Color verdeAzul = Color(0xFF002028);
const Color gris = Color(0xFF3A484B);
const Color cafe = Color(0xFF643F2D);
const Color rosa = Color(0xFFCDB6BB);

const double calendarMaxWidth = 300;
const double genericMargin = 40.0;
const double appBarHeight = 150.0;
const double textFieldWidth = 400.0;
