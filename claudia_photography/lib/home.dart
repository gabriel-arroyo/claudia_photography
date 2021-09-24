import 'package:claudia_photography/constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
          centerTitle: true,
          backgroundColor: materialCeleste,
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 16.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
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
            preferredSize: Size(0.0, 80.0),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: calendarMaxWidth),
              margin: const EdgeInsets.all(genericMargin),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                locale: 'es_MX',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
