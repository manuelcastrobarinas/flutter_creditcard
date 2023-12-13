import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:pagos_app/data/tarjetas.dart';
import 'package:pagos_app/helpers/alerts.dart';
import 'package:pagos_app/helpers/navegate_fadein.dart';
import 'package:pagos_app/pages/targets/targets_page.dart';

import '../../widgets/total_pay_button.dart';

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
            onPressed: () async {
              // showLoading(context);
              // await Future.delayed(const Duration(seconds: 1));
              // if(!context.mounted) return;
              // Navigator.pop(context);

              showAlert(context, 'hola', 'mundo');
            }, 
            icon: const  Icon(Icons.add),
          )
        ],
      ),
      body: SizedBox( 
        height: MediaQuery.of(context).size.height,
        child: const SizedBox(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: _TargetsListBuilder()),
              Positioned(
                bottom: 0,
                child: TotalPayButton()
              )
            ],
          ),
        ),
      )
    );
  }
}

class _TargetsListBuilder extends StatelessWidget {
  const _TargetsListBuilder();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: PageController(viewportFraction: 0.85),
      itemCount: tarjetas.length,
      itemBuilder: (_, i) {
        final tarjeta = tarjetas[i];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, navegateFadeIn(context, const TargetsPage()));
          },
          child: Hero(
            tag: tarjeta.cardNumber,
            child: CreditCardWidget(
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
              obscureCardNumber: true,
              obscureInitialCardNumber: false,
              obscureCardCvv: true,
              labelCardHolder: 'CARD HOLDER',
              width: MediaQuery.of(context).size.width,
              isSwipeGestureEnabled: false,
              frontCardBorder: Border.all(color: Colors.grey),
              backCardBorder: Border.all(color: Colors.grey),
              chipColor: Colors.amber,
            ),
          ),
        );
      }
    );
  }
}