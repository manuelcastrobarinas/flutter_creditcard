import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      child : const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Total'),
          Text('250.55 USD')
        ]),
        _ButtonPay(),
       
      ]),
    );
  }
}

class _ButtonPay extends StatelessWidget {
  const _ButtonPay();

  @override
  Widget build(BuildContext context) {
    return true
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
