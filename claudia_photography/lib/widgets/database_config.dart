import 'dart:collection';

import 'package:claudia_photography/firebaseCustom.dart';
import 'package:claudia_photography/models/calendar_utils.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ConfigureDatabase extends StatelessWidget {
  const ConfigureDatabase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: const Text(
              'Escribir DB',
            ),
            onPressed: () {
              renewSesiones();
            },
          ),
          // ElevatedButton(onPressed: readSesiones(), child: const Text('Leer')),
        ],
      ),
    );
  }

  void renewSesiones() {
    kDisponibles.forEach((date, eventsList) {
      for (var i = 0; i < eventsList.length; i++) {
        String year = date.year.toString();
        String month = date.month.toString().padLeft(2, '0');
        String day = date.day.toString().padLeft(2, '0');
        FirebaseDatabaseWeb.instance
            .reference()
            .child("sesiones")
            .child("disponible")
            .child('$year$month$day')
            .child('$i')
            .set(eventsList[i].toString());
      }
    });
  }
}

final kDisponibles = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(kDisponiblesSource);

final kDisponiblesSource = {
  for (var item in List.generate(120, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item): eventsHorarios
};

void setSessions() {
  DatabaseReference DataRef = Fire.database.ref("sesiones");

  DataRef.onValue.listen((event) {
    Map<String, dynamic>? sesiones = event.snapshot.val();
    if (sesiones == null) {
      return;
    }
    for (var timestamp in sesiones.keys) {
      DateTime date = DateTime.parse(timestamp);
      String hour = date.hour.toString();
      String minute = date.minute.toString().padLeft(2, '0');
      String time = '$hour:$minute';
      var formatedDate = DateTime(date.year, date.month, date.day);
      kEvents[formatedDate]!.removeWhere((element) => element.title == time);
    }
    // setState(() {
    //   ValueOfA = "A = $a";
    // });
  });
}
