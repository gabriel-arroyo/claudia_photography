import 'package:flutter/material.dart';

class PortfolioCarrousel extends StatelessWidget {
  const PortfolioCarrousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      fit: BoxFit.fitHeight,
      image: AssetImage('images/claudia.jpg'),
    );
  }

  Widget _frameBuilder(BuildContext context, Widget child, int? frame,
      bool wasSynchronouslyLoaded) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        color: Color(0x88FF2233),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: child,
    );
  }
}
