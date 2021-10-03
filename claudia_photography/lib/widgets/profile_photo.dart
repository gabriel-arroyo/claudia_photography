import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      fit: BoxFit.fitWidth,
      image: AssetImage('images/claudia_fondo.png'),
    );
  }
}
