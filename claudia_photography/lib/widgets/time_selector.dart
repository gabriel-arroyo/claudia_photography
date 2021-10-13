// import 'package:claudia_photography/widgets/calendar.dart';
import 'package:claudia_photography/models/constants.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/calendar_utils.dart';
import '../models/events.dart';

var buttonsStatus = List<bool>.generate(22, (int index) => false);

reboootTimeButtons() {
  buttonsStatus = List<bool>.generate(22, (int index) => false);
  selectedTime = '';
}

void setButtons(int item) {
  if (buttonsStatus[item]) {
    return;
  }
  buttonsStatus =
      List<bool>.generate(22, (int index) => index == item ? true : false);
}

class TimeSelector extends StatefulWidget {
  const TimeSelector({Key? key}) : super(key: key);

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  void initState() {
    super.initState();
    selectedEvents = ValueNotifier(List.empty());
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Event>>(
      valueListenable: selectedEvents,
      builder: (context, value, _) {
        return GridView.builder(
          padding: const EdgeInsets.all(2),
          shrinkWrap: false,
          itemCount: value.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
          ),
          itemBuilder: (contex, index) {
            return TimeButton(
              hora: '${value[index]}',
              onPress: () {
                setState(() {
                  setButtons(index);
                  selectedTime = '${value[index]}';
                });
              },
              color: buttonsStatus[index] ? primaryColor : secondaryAplphaColor,
            );
          },
        );
      },
    );
  }
}

class TimeButton extends StatelessWidget {
  final String hora;
  final Function onPress;
  final Color color;
  bool selected = false;

  TimeButton({
    Key? key,
    required this.hora,
    required this.onPress,
    required this.color,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Center(
          child: Text(
            hora,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
          ),
        ),
      ),
    );
  }
}

var text = RichText(
  text: const TextSpan(
    // Note: Styles for TextSpans must be explicitly defined.
    // Child text spans will inherit styles from parent
    style: TextStyle(
      fontSize: 22.0,
      color: Colors.black,
    ),
    children: <TextSpan>[
      TextSpan(
        text: '1. ',
        style: TextStyle(
            fontSize: 35.0, fontWeight: FontWeight.bold, color: primaryColor),
      ),
      TextSpan(
        text: 'Selecciona una fecha',
      ),
    ],
  ),
);
