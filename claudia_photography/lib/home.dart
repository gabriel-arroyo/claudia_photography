import 'package:claudia_photography/call_to_action.dart';
import 'package:claudia_photography/constants.dart';
import 'package:claudia_photography/example_calendar.dart';
import 'package:flutter/material.dart';
import 'client_form.dart';
import 'calendar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'portfolio_carrousel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'textos.dart';

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
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/fondo.jpg'), fit: BoxFit.fitWidth),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Expanded(flex: 1, child: Toldo()),
              Expanded(flex: 3, child: MyLayout()),
            ],
          ),
        ),
      ),
      floatingActionButton: const BotonAgendar(),
    );
  }
}

class MyLayout extends StatelessWidget {
  const MyLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int maxwidth = 800;
      int maxcols = 10;
      double topRows = constraints.maxWidth > maxwidth ? 8.0 : 12.0;
      double bottomRows = constraints.maxWidth > maxwidth ? 10.0 : 12.0;
      int leftcols = constraints.maxWidth > maxwidth ? 5 : maxcols;
      int rightcols =
          constraints.maxWidth > maxwidth ? maxcols - leftcols : maxcols;
      return StaggeredGridView.count(
        primary: false,
        crossAxisCount: maxcols,
        padding: const EdgeInsets.all(10.0),
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        staggeredTiles: <StaggeredTile>[
          StaggeredTile.count(leftcols, topRows),
          StaggeredTile.count(rightcols, topRows),
          StaggeredTile.count(maxcols, 2),
          StaggeredTile.count(leftcols, bottomRows),
          StaggeredTile.count(rightcols, bottomRows),
        ],
        children: const <Widget>[
          PortfolioCarrousel(),
          ExplanationText(),
          CallToAction(),
          CalendarWidget(),
          ClientForm(),
        ],
      );
    });
  }
}

class VoidRectangle extends StatelessWidget {
  final Color? color;
  const VoidRectangle({Key? key, this.color = Colors.red}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class Toldo extends StatelessWidget {
  final Color? color;
  const Toldo({Key? key, this.color = Colors.red}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FittedBox(
          child: Image.asset('images/toldo.png'),
          fit: BoxFit.cover,
        ));
  }
}

class ExplanationText extends StatelessWidget {
  const ExplanationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(35.0),
      alignment: Alignment.center,
      child: AutoSizeText(
        detalles,
        style: const TextStyle(fontSize: 20.0),
        maxLines: 80,
        minFontSize: 10.0,
        overflow: TextOverflow.visible,
      ),
    );
  }
}

class BotonAgendar extends StatelessWidget {
  const BotonAgendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: const Text('Agendar'),
      icon: const Icon(Icons.calendar_today),
    );
  }
}
