import 'package:flutter/material.dart';
import 'constants.dart';

class SelectedDate extends StatelessWidget {
  final BuildContext context;
  final DateTime date;
  final DateTime event;

  const SelectedDate(this.context, this.date, this.event, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        date.day.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class MarkerDate extends StatelessWidget {
  final BuildContext context;
  final DateTime date;
  final List<Object?> events;
  const MarkerDate(this.context, this.date, this.events, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(160),
        shape: BoxShape.circle,
      ),
      child: Text(
        date.day.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class TodayDate extends StatelessWidget {
  final BuildContext context;
  final DateTime date;
  final DateTime events;
  const TodayDate(this.context, this.date, this.events, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
        shape: BoxShape.rectangle,
      ),
      child: Text(
        date.day.toString(),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
