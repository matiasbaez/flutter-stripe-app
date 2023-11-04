import 'dart:io';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold )),
              Text('250.5 USD', style: TextStyle( fontSize: 20 )),
            ],
          ),

          _BtnPay()

        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {

  const _BtnPay({super.key});

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
    return true
      ? buildCreditCard(context)
      : buildAppleAndGooglePay(context);
  }
}