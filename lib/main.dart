import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_app/pages/pages.dart';
import 'package:stripe_app/bloc/blocs.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => PaymentBloc())
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stripe App',
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF284879),
        scaffoldBackgroundColor: const Color(0xFF21232A)
      ),
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        // 'card': (_) => const CardPage(),
        'payment_complete': (_) => const PaymentCompletePage(),
      },
    );
  }
}
