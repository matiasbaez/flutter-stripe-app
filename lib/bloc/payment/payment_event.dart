part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

class SelectedCardEvent extends PaymentEvent {

  final CustomCreditCard card;

  SelectedCardEvent({ required this.card });

}

class DisableCardEvent extends PaymentEvent {}