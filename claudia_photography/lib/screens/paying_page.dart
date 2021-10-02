import 'package:flutter/material.dart';
import '../widgets/pay_module.dart';

class PayingPage extends StatelessWidget {
  const PayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/fondo.jpg'), fit: BoxFit.fitWidth),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              PayWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
