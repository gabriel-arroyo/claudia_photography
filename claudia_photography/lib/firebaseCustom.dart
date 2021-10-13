// ignore_for_file:  avoid_print, non_constant_identifier_names, camel_case_types import_of_legacy_library_into_null_safe, import_of_legacy_library_into_null_safe, file_names
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase.dart';
import 'package:firebase_db_web_unofficial/DatabaseSnapshot.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';

//Replace These Values With Yours
class FirebaseHelper {
  static fb.Database initDatabase() {
    try {
      if (fb.apps.isEmpty) {
        fb.initializeApp(
            apiKey: "AIzaSyA4s0z03xBsWSEmRiyns-__LRR5Ak2Dl7Y",
            authDomain: "claudia-oropeza-photography.firebaseapp.com",
            databaseURL:
                "https://claudia-oropeza-photography-default-rtdb.firebaseio.com",
            projectId: "claudia-oropeza-photography",
            storageBucket: "claudia-oropeza-photography.appspot.com",
            messagingSenderId: "351849809393",
            appId: "1:351849809393:web:5d69e34d6438081e763050",
            measurementId: "G-NZQZVTHTQL");
      }
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
    return fb.database();
  }
}

class Fire {
  static fb.Database database = FirebaseHelper.initDatabase();
}

Future<String> getOnce(fb.DatabaseReference AdsRef) async {
  String a = '';
  await AdsRef.once('value').then((value) => {a = value.snapshot.val()});
  return a;
}

Future<List> getList(fb.DatabaseReference AdsRef) async {
  List list = [""];
  await AdsRef.once('value')
      .then((value) => {list = result(value.snapshot, list)});
  return list;
}

List result(DataSnapshot dp, List list) {
  list.clear();
  dp.forEach((v) {
    list.add(v);
  });
  return list;
}

Future<Map> getMap(fb.DatabaseReference AdsRef) async {
  Map map = {};
  await AdsRef.once('value').then((value) => {
        value.snapshot
            .forEach((date) => {map.putIfAbsent(date.key, () => date.val())})
      });
  return map;
}

void SetValue() {
  FirebaseDatabaseWeb.instance.reference().child("test").child("a").set("Hey");

  //To set a Single Value
  FirebaseDatabaseWeb.instance.reference().child("test").child("b").set("Guys");

  //To set Multiple Values
  FirebaseDatabaseWeb.instance.reference().child("test").child("c").set(
      {"1": "This will be", "2": "Your New", "3": "Journey to Web Devlopment"});
}

void UpdateValue() {
  //to update any node
  FirebaseDatabaseWeb.instance
      .reference()
      .child("test")
      .child("b")
      .update({"1": "Hello,", "2": "World!"});
}

Future<String> GetValueA() async {
  //this will return a Snapshot
  DatabaseSnapshot snap = await FirebaseDatabaseWeb.instance
      .reference()
      .child("test")
      .child("a")
      .once();
  return snap.value;
}

Future<String> GetValueA2() async {
  //another method to get String
  DatabaseReference UsersRef = Fire.database.ref().child("test").child("a");
  String userEmail = await getOnce(UsersRef);
  return userEmail;
}

Future<List> GetSnapshotList() async {
  //to get List of all Snapshot
  DatabaseReference DataRef = Fire.database.ref("test").child("c");
  List Data = await getList(DataRef);
  print(Data.toString());
  return Data;
}

void RealtimeUpdate() {
  DatabaseReference DataRef = Fire.database.ref("sesiones").child("disponible");

  DataRef.onValue.listen((event) {
    String a = event.snapshot.val();
    // setState(() {
    //   ValueOfA = "A = $a";
    // });
  });
}
