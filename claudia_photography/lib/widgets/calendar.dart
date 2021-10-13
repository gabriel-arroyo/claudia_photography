import 'dart:collection';

import 'package:claudia_photography/firebaseCustom.dart';
import 'package:claudia_photography/widgets/database_config.dart';
import 'package:claudia_photography/widgets/time_selector.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/calendar_utils.dart';
import '../models/constants.dart';
import '../models/events.dart';
import 'custom_date.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // late final ValueNotifier<List<Event>> _selectedEvents;
  // var kSessions = <DateTime, List<Event>>{};

  var mykEvents = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  @override
  void initState() {
    super.initState();

    setSessions();
    // readSesiones();

    _selectedDay = _focusedDay;
    selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    selectedEvents.dispose();
    super.dispose();
  }

  readSesiones() {
    DatabaseReference dataRef =
        Fire.database.ref("sesiones").child("disponible");

    dataRef.onValue.listen((event) {
      Map<String, List<String>> a = event.snapshot.val();
      Map<DateTime, List<Event>> events = a.map((date, events) {
        return MapEntry(DateTime.parse(date), [
          for (var i = 1; i < events.length; i++)
            Event(timeIndex: i, title: events[i])
        ]);
      });

      setState(() {
        mykEvents = mykEvents..addAll(events);
      });
    });
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
    // return mykEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    //if (!isSameDay(_selectedDay, selectedDay)) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      reboootTimeButtons();
    });
    selectedEvents.value = _getEventsForDay(selectedDay);
    selectedDate = selectedDay;
    //}
  }

  void _onFormatChanged(CalendarFormat format) {
    if (_calendarFormat != format) {
      setState(
        () {
          _calendarFormat = format;
        },
      );
    }
  }

  bool _getEnabledDay(DateTime day) {
    return _getEventsForDay(day).isEmpty ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50.0, right: 15.0),
      child: TableCalendar(
        shouldFillViewport: false,
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        locale: 'es_MX',
        calendarFormat: _calendarFormat,
        availableCalendarFormats: kCalendarFormats,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        enabledDayPredicate: _getEnabledDay,
        eventLoader: _getEventsForDay,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarStyle: kCalendarStyle,
        headerStyle: kCalendarHeaderStyle,
        onDaySelected: _onDaySelected,
        calendarBuilders: CalendarBuilders(
          markerBuilder: (_, date, events) =>
              events.isEmpty ? null : MarkerDate(date),
          todayBuilder: (_, date, __) => TodayDate(date),
          selectedBuilder: (_, date, __) => SelectedDate(date),
          disabledBuilder: (_, date, __) => DisabledDate(date),
        ),
        onFormatChanged: (format) => _onFormatChanged(format),
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}

// final kDisponibles = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(kDisponiblesSource);

// final kDisponiblesSource = {
//   for (var item in List.generate(120, (index) => index))
//     DateTime.utc(kFirstDay.year, kFirstDay.month, item): eventsHorarios
// };

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
