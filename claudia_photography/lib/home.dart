import 'package:claudia_photography/constants.dart';
import 'package:flutter/material.dart';
import 'client_form.dart';
import 'calendar.dart';

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
        preferredSize: const Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: celeste,
          bottom: bottomAppBar,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return Center(
                child: Column(
                  children: [
                    CalendarWidget(),
                    ClientForm(),
                  ],
                ),
              );
            } else {
              return Center(
                child: Row(
                  children: [
                    CalendarWidget(),
                    ClientForm(),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
