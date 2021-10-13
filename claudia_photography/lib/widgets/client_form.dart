import 'package:claudia_photography/models/events.dart';
import 'package:claudia_photography/widgets/time_selector.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({
    Key? key,
  }) : super(key: key);
  //final FirebaseApp? app;

  @override
  _ClientFormState createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  final _formKey = GlobalKey<FormState>();
  final Client _newClient = Client();
  String persons = '1';
  bool rememberInfo = false;
  bool loading = false;

  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.

    nombreController.dispose();
    super.dispose();
  }

  _launchURLBrowser() async {
    const url = 'https://buy.stripe.com/dR68Ad3jz5ntceYdQQ';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la página de pago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: nombreController,
                onSaved: (val) => _newClient.name = val ?? '',
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  icon: Icon(Icons.account_circle),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Favor de escribir su nombre';
                  return null;
                },
              ),
              TextFormField(
                controller: apellidoController,
                onSaved: (val) => _newClient.lastname = val ?? '',
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  icon: Icon(Icons.account_circle),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Favor de escribir su apellido';
                  return null;
                },
              ),
              TextFormField(
                onSaved: (val) => _newClient.phone = val ?? '',
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  icon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Favor de escribir su teléfono';
                  if (value.length != 10) {
                    return 'Por favor ingrese un número de 10 dígitos';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                onSaved: (val) => _newClient.email = val ?? '',
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  icon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Favor de escribir su correo electrónico';
                  }
                  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  final regExp = RegExp(pattern);
                  if (!regExp.hasMatch(value)) {
                    return 'Escriba un correo válido';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                onSaved: (val) => _newClient.persons = val ?? '1',
                value: persons,
                items: ['1', '2', '3', '4', '5'].map<DropdownMenuItem<String>>(
                  (String val) {
                    return DropdownMenuItem(
                      child: Text(val),
                      value: val,
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(() {
                    persons = val ?? '1';
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Número de personas',
                  icon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (selectedTime == '') {
                    return;
                  }
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Agendando...'),
                      duration: const Duration(seconds: 1),
                      action: SnackBarAction(
                        label: 'Cancelar',
                        onPressed: () {},
                      ),
                      onVisible: () {
                        loading = true;
                      },
                    ));
                    setState(() {
                      _saveSession(_newClient);
                      reboootTimeButtons();
                    });

                    _launchURLBrowser();
                  }
                },
                child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: const Text('Pagar reservación')),
              ),
            ]), // we will work in here
          ],
        ),
      ),
    );
  }
}

void _saveSession(Client newClient) {
  String year = selectedDate.year.toString();
  String month = selectedDate.month.toString().padLeft(2, '0');
  String day = selectedDate.day.toString().padLeft(2, '0');
  String hour = selectedTime.split(':')[0].padLeft(2, '0');
  String minute = selectedTime.split(':')[1].padLeft(2, '0');
  String formatedTime = '$year$month$day' 'T' '$hour$minute' '00';
  FirebaseDatabaseWeb.instance
      .reference()
      .child("sesiones")
      .child(formatedTime)
      .set({
    'name': newClient.name,
    'lastname': newClient.lastname,
    'phone': newClient.phone,
    'email': newClient.email,
    'persons': newClient.persons
  });

  // //To set a Single Value
  // FirebaseDatabaseWeb.instance.reference().child("test").child("b").set("Guys");

  // //To set Multiple Values
  // FirebaseDatabaseWeb.instance.reference().child("test").child("c").set(
  //     {"1": "This will be", "2": "Your New", "3": "Journey to Web Devlopment"});
}

class Client {
  String name;
  String lastname;
  String phone;
  String email;
  String persons;

  Client(
      {this.name = '',
      this.lastname = '',
      this.phone = '',
      this.email = '',
      this.persons = ''});
}
