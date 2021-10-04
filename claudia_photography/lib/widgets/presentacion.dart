import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/textos.dart';
import 'package:relative_scale/relative_scale.dart';

class PresentacionCard extends StatelessWidget {
  const PresentacionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(15),
          elevation: 10,
          child: ListTile(
            contentPadding: const EdgeInsets.all(20),
            title: AutoSizeText(
              tituloPresentacion,
              style: TextStyle(
                fontSize: sx(12),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              presentacion,
              style: TextStyle(
                fontSize: sx(9),
              ),
            ),
          ),
        );
      },
    );
  }
}
