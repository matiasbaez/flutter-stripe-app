import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/bloc/blocs.dart';

class BtnTotalToPayWidget extends StatelessWidget {

  const BtnTotalToPayWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 100,
      padding: const EdgeInsets.symmetric( horizontal: 15 ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold )),
              Text('250.5 USD', style: TextStyle( fontSize: 20 )),
            ],
          ),

          BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return _BtnPay( state: state );
            },
          ),

        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {

  final PaymentState state;

  const _BtnPay({
    super.key,
    required this.state
  });

  Widget buildCreditCard(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 170,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon( FontAwesomeIcons.solidCreditCard, color: Colors.white ),
          Text('  Pay', style: TextStyle( color: Colors.white, fontSize: 22 ))
        ],
      ),
    );
  }

  Widget buildAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Platform.isAndroid
          ? const Icon( FontAwesomeIcons.google, color: Colors.white )
          : const Icon( FontAwesomeIcons.apple, color: Colors.white ),
          const Text(' Pay', style: TextStyle( color: Colors.white, fontSize: 22 ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return state.cardActive
      ? buildCreditCard(context)
      : buildAppleAndGooglePay(context);
  }
}