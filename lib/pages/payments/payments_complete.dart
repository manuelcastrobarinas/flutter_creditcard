import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentsCompletePage extends StatelessWidget {
  const PaymentsCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('pago Realizado!')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.star, color: Colors.white54, size: 100),
            SizedBox(height: 20.0),
            Text('Pago Realizado Correctamente!', style: TextStyle(color: Colors.white, fontSize: 20.0),),
          ],
        )
      ),
    );
  }
}