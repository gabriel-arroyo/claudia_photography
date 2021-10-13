import 'package:flutter/material.dart';
import 'calendar_utils.dart';

late ValueNotifier<List<Event>> selectedEvents = ValueNotifier(List.empty());

String selectedTime = '';
DateTime selectedDate = DateTime.now();
