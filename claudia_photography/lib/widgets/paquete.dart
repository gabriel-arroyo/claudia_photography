import 'package:flutter/material.dart';

class PaqueteTexto extends StatelessWidget {
  const PaqueteTexto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      fit: BoxFit.fitHeight,
      image: AssetImage('images/paquete.png'),
    );
  }
}
