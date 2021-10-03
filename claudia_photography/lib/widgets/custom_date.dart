import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/constants.dart';

class SelectedDate extends StatelessWidget {
  final DateTime date;

  const SelectedDate(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xFF000000),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0xB2105337),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        date.day.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MarkerDate extends StatelessWidget {
  final DateTime date;
  const MarkerDate(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xB933A828),
        shape: BoxShape.circle,
      ),
      child: Text(
        date.day.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class DisabledDate extends StatelessWidget {
  final DateTime date;
  const DisabledDate(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        shape: BoxShape.rectangle,
      ),
      child: Text(
        date.day.toString(),
        style: const TextStyle(
          color: Color(0x80000000),
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class TodayDate extends StatelessWidget {
  final DateTime date;
  const TodayDate(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 3.0),
        borderRadius: BorderRadius.circular(10.0),
        shape: BoxShape.rectangle,
      ),
      child: Text(
        date.day.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
