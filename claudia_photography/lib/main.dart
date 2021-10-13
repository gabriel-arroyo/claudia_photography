import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/constants.dart';
import 'screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ClaudiaPhotography());
}

class ClaudiaPhotography extends StatelessWidget {
  //const ClaudiaPhotography({Key? key}) : super(key: key);
  const ClaudiaPhotography() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

class SomethingWentWrong extends StatelessWidget {
  // const SomethingWentWrong({Key? key}) : super(key: key);
  const SomethingWentWrong() : super();

  @override
  Widget build(BuildContext context) {
    return const Text('Algo anda mal');
  }
}

class Loading extends StatelessWidget {
  //const Loading({Key? key}) : super(key: key);
  const Loading() : super();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Cargando...',
      ),
    );
  }
}
