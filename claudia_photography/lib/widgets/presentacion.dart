//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../models/textos.dart';

class PresentacionCard extends StatefulWidget {
  final double size;
  const PresentacionCard({Key? key, required this.size}) : super(key: key);

  @override
  State<PresentacionCard> createState() => _PresentacionCardState();
}

class _PresentacionCardState extends State<PresentacionCard> {
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
            title: Text(
              tituloPresentacion,
              style: TextStyle(
                fontSize: sx(14),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Center(
              child: Text(
                presentacion,
                style: TextStyle(
                  fontSize: widget.size,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
