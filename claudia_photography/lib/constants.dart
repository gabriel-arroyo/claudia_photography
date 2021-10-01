import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

const Color primaryColor = Color(0xFFBD1522);
const Color secondaryColor = Color(0xFFC5313D);
const Color secondaryAplphaColor = Color(0x88C5313D);
const Color tertiaryColor = Color(0xFFFF7300);
const Color backgroundColor = Color(0xFFFFFFFF);
const Color textTitleColor = Color(0xFFFFFFFF);
const Color textColor = verdeAzul;

MaterialColor primaryMaterialColor = createMaterialColor(primaryColor);
MaterialColor secondaryMaterialColor = createMaterialColor(secondaryColor);
MaterialColor tertiaryMaterialColor = createMaterialColor(tertiaryColor);
MaterialColor textTitleMaterialColor = createMaterialColor(textTitleColor);
MaterialColor textMaterialColor = createMaterialColor(textColor);

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
const double appBarHeight = 120.0;
const double textFieldWidth = 400.0;

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
  primarySwatch: primaryMaterialColor,
  scaffoldBackgroundColor: backgroundColor,
);

const TextStyle titleStyle = TextStyle(
  fontFamily: 'Amsterdam',
  color: textTitleColor,
);

const TextStyle subtitleStyle = TextStyle(
  fontFamily: 'Baskerville',
  fontSize: 16.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  letterSpacing: 8.0,
);

// calendar
CalendarStyle kCalendarStyle = const CalendarStyle(
  // Use `CalendarStyle` to customize the UI
  outsideDaysVisible: false,
  markerDecoration: BoxDecoration(
    color: tertiaryColor,
    shape: BoxShape.circle,
  ),
//  todayDecoration: BoxDecoration(
//    color: secondaryAplphaColor,
//    shape: BoxShape.rectangle,
//  ),
//  selectedDecoration: BoxDecoration(
//    color: primaryColor,
//    shape: BoxShape.circle,
//  ),
);

HeaderStyle kCalendarHeaderStyle = const HeaderStyle(
  titleCentered: true,
  formatButtonVisible: false,
);
