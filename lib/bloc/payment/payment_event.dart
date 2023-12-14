part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

class OnSelectTarget extends PaymentEvent{
  final TarjetaCreditoModel target;
  OnSelectTarget({required this.target}); 
}

class OnDesactivateTarget extends PaymentEvent{}
