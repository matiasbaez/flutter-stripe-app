import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stripe_app/models/models.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {

  PaymentBloc() : super(const PaymentState()) {
    on<SelectedCardEvent>((event, emit) => emit(state.copyWith( cardActive: true, card: event.card )));

    on<DisableCardEvent>((event, emit) => emit(state.copyWith( cardActive: false, card: null )));
  }

}
