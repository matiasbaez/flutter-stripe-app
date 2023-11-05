import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/bloc/blocs.dart';

import 'package:stripe_app/widgets/widgets.dart';

class CardPage extends StatelessWidget {

  const CardPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final paymentBloc = BlocProvider.of<PaymentBloc>(context);
    final card = paymentBloc.state.card!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        leading: IconButton(
          icon: const Icon( Icons.arrow_back ),
          onPressed: () {
            paymentBloc.add(DisableCardEvent());
            Navigator.pop(context);
          },
        ),
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