part of 'payment_bloc.dart';

@immutable
class PaymentState {

  final double amount;
  final String currency;
  final bool cardActive;
  final CustomCreditCard? card;

  const PaymentState({
    this.amount = 0,
    this.currency = 'USD',
    this.cardActive = false,
    this.card
  });

  PaymentState copyWith({
    double? amount,
    String? currency,
    bool? cardActive,
    CustomCreditCard? card,
  }) => PaymentState(
    card      : card ?? this.card,
    amount    : amount ?? this.amount,
    currency  : currency ?? this.currency,
    cardActive: cardActive ?? this.cardActive,
  );

}

// final class PaymentInitial extends PaymentState {}
