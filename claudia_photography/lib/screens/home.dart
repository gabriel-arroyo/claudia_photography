import 'package:claudia_photography/widgets/paquete.dart';
import 'package:claudia_photography/widgets/presentacion.dart';
import 'package:claudia_photography/widgets/time_selector.dart';

import '../widgets/call_to_action.dart';
import 'package:flutter/material.dart';
import '../widgets/client_form.dart';
import '../widgets/calendar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/profile_photo.dart';
import '../models/textos.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../widgets/paquete.dart';

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

class Size {
  int x;
  double y;
  Size(this.x, this.y);
}

class MyLayout extends StatelessWidget {
  const MyLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int maxcols = 10;
      int maxwidth = 800;
      int middlewidth = 500;
      List<Size> sizes = <Size>[
        Size(10, 10),
        Size(10, 10),
        Size(10, 10),
        Size(10, 10),
        Size(10, 10),
        Size(10, 10),
        Size(10, 10),
      ];

      if (constraints.maxWidth > maxwidth) {
        //Presentación
        sizes[0].x = 10;
        sizes[0].y = 2.2;
        //Foto
        sizes[1].x = 5;
        sizes[1].y = 4;
        //Paquete
        sizes[2].x = 5;
        sizes[2].y = 5;
        //Agenda tu sesion
        sizes[3].x = 10;
        sizes[3].y = 1;
        //Calendario
        sizes[4].x = 3;
        sizes[4].y = 6;
        //Horas
        sizes[5].x = 3;
        sizes[5].y = 6;
        //Formulario
        sizes[6].x = 4;
        sizes[6].y = 6;
      } else if (constraints.maxWidth > middlewidth) {
        //Presentación
        sizes[0].x = 10;
        sizes[0].y = 3;
        //Foto
        sizes[1].x = 5;
        sizes[1].y = 5;
        //Paquete
        sizes[2].x = 5;
        sizes[2].y = 6;
        //Agenda tu sesion
        sizes[3].x = 10;
        sizes[3].y = 1;
        //Calendario
        sizes[4].x = 7;
        sizes[4].y = 7.1;
        //Horas
        sizes[5].x = 3;
        sizes[5].y = 7;
        //Formulario
        sizes[6].x = 10;
        sizes[6].y = 13;
      } else {
        //Presentación
        sizes[0].x = 10;
        sizes[0].y = 4;
        //Foto
        sizes[1].x = 5;
        sizes[1].y = 6;
        //Paquete
        sizes[2].x = 5;
        sizes[2].y = 7;
        //Agenda tu sesion
        sizes[3].x = 10;
        sizes[3].y = 1;
        //Calendario
        sizes[4].x = 10;
        sizes[4].y = 12;
        //Horas
        sizes[5].x = 5;
        sizes[5].y = 5;
        //Formulario
        sizes[6].x = 10;
        sizes[6].y = 15;
      }

      return StaggeredGridView.count(
        primary: false,
        crossAxisCount: maxcols,
        padding: const EdgeInsets.all(10.0),
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        staggeredTiles: <StaggeredTile>[
          StaggeredTile.count(sizes[0].x, sizes[0].y),
          StaggeredTile.count(sizes[1].x, sizes[1].y),
          StaggeredTile.count(sizes[2].x, sizes[2].y),
          StaggeredTile.count(sizes[3].x, sizes[3].y),
          StaggeredTile.count(sizes[4].x, sizes[4].y),
          StaggeredTile.count(sizes[5].x, sizes[5].y),
          StaggeredTile.count(sizes[6].x, sizes[6].y),
        ],
        children: const <Widget>[
          PresentacionCard(),
          ProfilePhoto(),
          PaqueteTexto(),
          CallToAction(),
          CalendarWidget(),
          TimeSelector(),
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
        overflow: TextOverflow.clip,
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
