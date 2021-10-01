import 'package:flutter/material.dart';

class PayWidget extends StatefulWidget {
  const PayWidget({ Key? key }) : super(key: key);

  @override
  _PayWidgetState createState() => _PayWidgetState();
}

class _PayWidgetState extends State<PayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Card(color: Colors.red),
    );
  }
}