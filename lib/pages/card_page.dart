import 'package:flutter/material.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:stripe_app/widgets/widgets.dart';
import 'package:stripe_app/models/models.dart';

class CardPage extends StatelessWidget {

  const CardPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final card = CustomCreditCard(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Fernando Herrera'
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
      ),
      body: Stack(
        children: [

          Container(),

          Hero(
            tag: card.cardNumber,
            child: CreditCardWidget(
              cardHolderName: card.cardHolderName,
              cardNumber: card.cardNumber,
              cvvCode: card.cvv,
              expiryDate: card.expiracyDate,
              showBackView: false,
              isSwipeGestureEnabled: false,
              onCreditCardWidgetChange: ( CreditCardBrand ) {},
            ),
          ),

          const Positioned(
            bottom: 0,
            child: BtnTotalToPayWidget()
          ),
        ],
      ),
    );
  }
}