import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constants.dart';
import 'home.dart';

void main() {
  runApp(const ClaudiaPhotography());
}

class ClaudiaPhotography extends StatelessWidget {
  const ClaudiaPhotography({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Claudia Oropeza Photography',
      theme: theme,
      home: const MyHomePage(title: 'Claudia Oropeza Photography'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'MX'), // Spanish, no country code
      ],
    );
  }
}

