import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:pagos_app/bloc/payment/payment_bloc.dart';
import 'package:pagos_app/widgets/total_pay_button.dart';

class TargetsPage extends StatelessWidget {
  const TargetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final creditTarget = BlocProvider.of<PaymentBloc>(context).state.target;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('pagar'),
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<PaymentBloc>(context).add(OnDesactivateTarget());
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios)
        ),
      ),
      body:  Stack(
        children: [
          Container(),
          Hero(
            tag: creditTarget!.cardNumber,
            child: CreditCardWidget(
              cardNumber: creditTarget.cardNumber, 
              expiryDate: creditTarget.expiracyDate, 
              cardHolderName: creditTarget.cardHolderName, 
              cvvCode: creditTarget.cvv, 
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