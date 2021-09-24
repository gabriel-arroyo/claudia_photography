import 'package:claudia_photography/constants.dart';
import 'package:flutter/material.dart';

// Create a Form widget.
class ClientForm extends StatefulWidget {
  const ClientForm({Key? key}) : super(key: key);

  @override
  ClientFormState createState() {
    return ClientFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class ClientFormState extends State<ClientForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      constraints: const BoxConstraints(maxWidth: calendarMaxWidth),
      margin: const EdgeInsets.all(genericMargin),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: textFieldWidth,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Ingresa tu nombre y apellido',
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: textFieldWidth,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'Ingresa tu número telefónico',
                  labelText: 'Teléfono',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu número telefónico';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: textFieldWidth,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  hintText: 'Ingresa tu correo electrónico',
                  labelText: 'Correo electrónico',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa tu correo electronico';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(celeste),
                ),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Agendar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
