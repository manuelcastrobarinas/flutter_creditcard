import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pagos_app/data/tarjetas.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('pagar'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const  Icon(Icons.add),
          )
        ],
      ),
      body: SizedBox(
  
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          child: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: PageController(viewportFraction: 0.85),
                itemCount: tarjetas.length,
                itemBuilder: (_, i) {
                  final tarjeta = tarjetas[i];
                  return CreditCardWidget(
                    cardNumber: tarjeta.cardNumber,
                    expiryDate: tarjeta.expiracyDate, 
                    cardHolderName: tarjeta.cardHolderName, 
                    cvvCode: tarjeta.cvv, 
                    showBackView: false, 
                    onCreditCardWidgetChange: (creditCardBrand){
                    },             
                    enableFloatingCard: true,
                    floatingConfig: const FloatingConfig(
                      isGlareEnabled: true,
                      isShadowEnabled: true,
                      shadowConfig: FloatingShadowConfig(),
                    ),
                   cardBgColor: Colors.blueGrey,
                    obscureCardNumber: true,
                    obscureInitialCardNumber: false,
                    obscureCardCvv: true,
                    labelCardHolder: 'CARD HOLDER',
                    width: MediaQuery.of(context).size.width,
                    isSwipeGestureEnabled: true,
                    frontCardBorder: Border.all(color: Colors.grey),
                    backCardBorder: Border.all(color: Colors.grey),
                    chipColor: Colors.amber,
                  );
                }
              ),
              Positioned(
                bottom: 0,
                child: Container(
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
                )
              )
            ],
          ),
        ),
      )
    );
  }
}

class _ButtonPay extends StatelessWidget {
  const _ButtonPay({super.key});

  @override
  Widget build(BuildContext context) {
    return true
    ? BuildButtonTarget()
    : BuildButtonAppleAndGooglePay();
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