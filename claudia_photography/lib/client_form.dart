import 'dart:async';

import 'package:claudia_photography/constants.dart';
import 'package:flutter/material.dart';
import 'dropdown_formfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({Key? key}) : super(key: key);

  @override
  _ClientFormState createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  final _formKey = GlobalKey<FormState>();
  Client _newClient = Client();
  String persons = '1';
  bool rememberInfo = false;
  final _phoneController = TextEditingController();
  bool loading = false;

  final List personsList = List.generate(5, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              TextFormField(
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
                controller: _phoneController,
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
                onSaved: (val) => _newClient.email = val ?? '',
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  icon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Favor de escribir su correo electrónico';
                  }
                  if (RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
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
                  if (_formKey.currentState!.validate()) {
                    setState(() {});
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
                  }
                },
                child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: const Text('Enviar')),
              ),
            ]), // we will work in here
          ],
        ),
      ),
    );
  }
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
