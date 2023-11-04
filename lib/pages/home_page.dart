import 'package:flutter/material.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:stripe_app/data/credit_cards.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/widgets/widgets.dart';
import 'package:stripe_app/pages/pages.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon( Icons.add ) )
        ],
      ),
      body: Stack(
        children: [

          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.85
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: stripeCards.length,
              itemBuilder: ( _, i ) {
                final card = stripeCards[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, navigateFadeIn(context, const CardPage()));
                  },
                  child: Hero(
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
                );
              }
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