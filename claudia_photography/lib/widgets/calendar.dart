import 'package:flutter/material.dart';
import '../models/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/calendar_utils.dart';
import 'time_selector.dart';
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
  //late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    //if (!isSameDay(_selectedDay, selectedDay)) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    selectedEvents.value = _getEventsForDay(selectedDay);
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
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
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
          ),
        ),
        //Expanded(
        //   flex: 2,
        //  child: TimeSelector(
        //   selectedEvents: _selectedEvents,
        // )),
      ],
    );
  }
}
