import 'package:claudia_photography/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/calendar_utils.dart';
import '../models/constants.dart';
import '../models/events.dart';

class TimeSelector extends StatefulWidget {
  const TimeSelector({Key? key}) : super(key: key);

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
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
            crossAxisCount: 4,
            childAspectRatio: 2,
          ),
          itemBuilder: (contex, index) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Center(
                child: Text(
                  '${value[index]}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class TimeButtonsColumn extends StatelessWidget {
  final List<Event> events;
  final int min;
  final int max;
  const TimeButtonsColumn(
    this.events,
    this.min,
    this.max, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: events.length,
        itemBuilder: (context, index) {
          bool turnoMatutino = false;
          if (index >= min && index < max) {
            turnoMatutino = true;
          }
          return turnoMatutino
              ? TimeButton(events[index])
              : const SizedBox(height: 0.0);
        },
      ),
    );
  }
}

class TimeButton extends StatelessWidget {
  final Event event;
  const TimeButton(
    this.event, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50.0, maxWidth: 75.0),
      child: Container(
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.symmetric(
          horizontal: 2.0,
          vertical: 1.0,
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListTile(
          title: Text(
            '$event',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
