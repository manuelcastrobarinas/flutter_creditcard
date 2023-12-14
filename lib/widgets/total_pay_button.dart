import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pagos_app/bloc/payment/payment_bloc.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(
        color : Colors.white,
        borderRadius: BorderRadius.only( topLeft: Radius.circular(30), topRight: Radius.circular(30))
      ),
      child : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Total'),
          Text('250.55 USD')
        ]),
        BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            return  _ButtonPay(state: state);
          },
        ),
       
      ]),
    );
  }
}

class _ButtonPay extends StatelessWidget {
  final PaymentState state;
  const _ButtonPay({required this.state});

  @override
  Widget build(BuildContext context) {
    return state.isTargetActive
    ? const BuildButtonTarget()
    : const BuildButtonAppleAndGooglePay();
  }
}

class BuildButtonTarget extends StatelessWidget {
  const BuildButtonTarget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: const Row(
        children: [
          Icon(FontAwesomeIcons.creditCard, color: Colors.white),
          SizedBox(width: 10),
          Text('Pagar', style: TextStyle(color: Colors.white, fontSize: 20),),
        ],
      ),
      onPressed: (){},
    );
  }
}

class BuildButtonAppleAndGooglePay extends StatelessWidget {
  const BuildButtonAppleAndGooglePay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          Icon(
            Platform.isAndroid 
            ? FontAwesomeIcons.google
            : FontAwesomeIcons.apple,
            color: Colors.white
            ),
          const SizedBox(width: 10),
          const Text('Pagar', style: TextStyle(color: Colors.white, fontSize: 20),),
        ],
      ),
      onPressed: (){},
    );
  }
}
