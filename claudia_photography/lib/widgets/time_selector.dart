import 'package:flutter/material.dart';
import '../models/calendar_utils.dart';
import '../models/constants.dart';

class TimeSelector extends StatefulWidget {
  final ValueNotifier<List<Event>> selectedEvents;
  const TimeSelector({Key? key, required this.selectedEvents})
      : super(key: key);

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Event>>(
      valueListenable: widget.selectedEvents,
      builder: (context, value, _) {
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: value.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 1.0,
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Column(
                  children: [
                    Text(
                      '${value[index]}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
