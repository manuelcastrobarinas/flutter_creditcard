import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:pagos_app/widgets/total_pay_button.dart';

import '../../models/credit_card_model.dart';

class TargetsPage extends StatelessWidget {
  const TargetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tarjeta = TarjetaCreditoModel(cardNumberHidden: '4242', cardNumber: '4242424242424242', brand: 'visa', cvv: '213', expiracyDate: '01/25', cardHolderName: 'Manuel Castro');
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: const Text('pagar'),),
      body:  Stack(
        children: [
          Container(),
          Hero(
            tag: tarjeta.cardNumber,
            child: CreditCardWidget(
              cardNumber: tarjeta.cardNumber, 
              expiryDate: tarjeta.expiracyDate, 
              cardHolderName: tarjeta.cardHolderName, 
              cvvCode: tarjeta.cvv, 
              showBackView: false, 
              onCreditCardWidgetChange: (onCreditCardWidgetChange) {}
            ),
          ),
          const Positioned(
            bottom: 0,
            child: TotalPayButton()
          )
        ],
      ),
    );
  }
} 