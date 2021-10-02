import 'package:flutter/material.dart';
import '../models/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/calendar_utils.dart';
import 'time_selector.dart';
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
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return  kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    //if (!isSameDay(_selectedDay, selectedDay)) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    _selectedEvents.value = _getEventsForDay(selectedDay);
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 500.0,
              maxWidth: 300,
            ),
            padding: const EdgeInsets.only(left: 50.0, right: 15.0),
            child: TableCalendar(
              shouldFillViewport: true,
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              locale: 'es_MX',
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              availableCalendarFormats: kCalendarFormats,
              enabledDayPredicate: _getEnabledDay,
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: kCalendarStyle,
              headerStyle: kCalendarHeaderStyle,
              onDaySelected: _onDaySelected,
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (contex, date, events) =>
                    SelectedDate(context, date, events),
                markerBuilder: (context, date, events) =>
                    events.isEmpty ? null : MarkerDate(context, date, events),
                todayBuilder: (context, date, events) =>
                    TodayDate(context, date, events),
              ),
              onFormatChanged: (format) => _onFormatChanged(format),
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: TimeSelector(
              selectedEvents: _selectedEvents,
            )),
      ],
    );
  }
}
