import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/credit_card_model.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState()) {
    
    on<OnSelectTarget>((event, emit) => emit(state.copyWith( isTargetActive: true, target: event.target)));
    on<OnDesactivateTarget>((event,emit) => emit(state.copyWith(isTargetActive: false)));
    // async* {
    //   if (event is OnSelectTarget) {
    //     yield state.copyWith(isTargetActive: true, target: event.target);
    //   } else if (event is OnDesactivateTarget) {
    //     yield state.copyWith(isTargetActive: false);
    //   }
    // });  
  }
}
