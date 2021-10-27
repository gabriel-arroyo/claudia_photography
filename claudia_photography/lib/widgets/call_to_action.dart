import 'package:flutter/material.dart';

import '../models/constants.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            'Agenda tu sesión',
            style: TextStyle(
              fontSize: 60,
              fontFamily: 'Christmas',
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
