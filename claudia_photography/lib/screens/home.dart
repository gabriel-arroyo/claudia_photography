import 'package:claudia_photography/widgets/calendar.dart';
import 'package:claudia_photography/widgets/client_form.dart';
import 'package:claudia_photography/widgets/paquete.dart';
import 'package:claudia_photography/widgets/presentacion.dart';
import 'package:claudia_photography/widgets/time_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/textos.dart';
import '../widgets/call_to_action.dart';
import '../widgets/paquete.dart';
import '../widgets/profile_photo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    controller = ScrollController();
  }

  final scrollDirection = Axis.vertical;

  late ScrollController controller;

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/fondo.jpg'), fit: BoxFit.scaleDown),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(flex: 3, child: Toldo()),
              Expanded(
                  flex: 10,
                  child: MyLayout(
                    scrollController: controller,
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.animateTo(controller.position.maxScrollExtent,
              duration: const Duration(seconds: 3),
              curve: Curves.fastOutSlowIn);
        },
        label: const Text('Agendar'),
        icon: const Icon(Icons.calendar_today),
      ),
    );
  }
}

int maxCols = 10;
int widgetsNum = 7;

class WidgetSize {
  int x = maxCols;
  double y = maxCols.toDouble();
  double padding = 8.0;
  WidgetSize(this.x, this.y, {this.padding = 8.0});
}

List<int> screenSizes = [960, 720, 480, 240];
List<List<List<double>>> sizes = <List<List<double>>>[];

void generateSizes() {
  List<List<double>> pantalla1 = [];
  List<List<double>> pantalla2 = [];
  List<List<double>> pantalla3 = [];
  List<List<double>> pantalla4 = [];

  pantalla1.add([10, 2, 18]);
  pantalla1.add([5, 4.5, 10]);
  pantalla1.add([5, 4.5, 10]);
  pantalla1.add([10, 1, 10]);
  pantalla1.add([3, 4, 10]);
  pantalla1.add([3, 4, 40]);
  pantalla1.add([4, 4, 10]);

  pantalla2.add([10, 2.5, 14]);
  pantalla2.add([4, 4.5, 10]);
  pantalla2.add([6, 4.5, 10]);
  pantalla2.add([10, 1, 10]);
  pantalla2.add([4, 5, 10]);
  pantalla2.add([3, 5, 10]);
  pantalla2.add([3, 5, 10]);

  pantalla3.add([10, 4.1, 13]);
  pantalla3.add([10, 6, 10]);
  pantalla3.add([10, 10, 10]);
  pantalla3.add([10, 1, 10]);
  pantalla3.add([10, 8, 10]);
  pantalla3.add([10, 8, 80]);
  pantalla3.add([10, 10, 10]);

  pantalla4.add([10, 6.5, 12]);
  pantalla4.add([10, 7, 10]);
  pantalla4.add([10, 13, 10]);
  pantalla4.add([10, 1, 10]);
  pantalla4.add([10, 10, 10]);
  pantalla4.add([10, 7, 70]);
  pantalla4.add([10, 12, 10]);

  sizes.add(pantalla1);
  sizes.add(pantalla2);
  sizes.add(pantalla3);
  sizes.add(pantalla4);
}

class MyLayout extends StatelessWidget {
  final ScrollController scrollController;
  const MyLayout({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      generateSizes();
      int mySize = 0;
      double width = constraints.maxWidth;
      for (var i = 0; i < screenSizes.length; i++) {
        if (width > screenSizes[i]) {
          mySize = i;
          break;
        }
      }
      return StaggeredGridView.count(
        controller: scrollController,
        primary: false,
        crossAxisCount: maxCols,
        padding: const EdgeInsets.all(10.0),
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        staggeredTiles: List.generate(
          widgetsNum,
          (index) => StaggeredTile.count(
              sizes[mySize][index][0].toInt(), sizes[mySize][index][1]),
        ),
        children: <Widget>[
          PresentacionCard(
            size: sizes[mySize][0][2],
          ),
          const ProfilePhoto(),
          const PaqueteTexto(),
          const CallToAction(),
          const CalendarWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sizes[mySize][5][2]),
            child: const TimeSelector(),
          ),
          const ClientForm(),
          // ConfigureDatabase(),
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

class Toldo extends StatefulWidget {
  final Color? color;
  const Toldo({Key? key, this.color = Colors.red}) : super(key: key);

  @override
  State<Toldo> createState() => _ToldoState();
}

class _ToldoState extends State<Toldo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 115.0),
      color: Colors.white,
      child: FittedBox(
        child: Image.asset('images/toldox2.png'),
        fit: BoxFit.cover,
      ),
    );
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
      child: Text(
        detalles,
        style: const TextStyle(fontSize: 20.0),
        maxLines: 80,
        //minFontSize: 10.0,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
