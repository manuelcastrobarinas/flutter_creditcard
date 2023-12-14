part of 'payment_bloc.dart';

class PaymentState {
  final double amountPay;
  final String coin;
  final bool isTargetActive;
  final TarjetaCreditoModel? target;

  PaymentState({
    this.amountPay = 375.55, 
    this.coin = 'USD', 
    this.isTargetActive = false, 
    this.target
  });
  

  PaymentState copyWith({
    double? amountPay,
    String? coin,
    bool? isTargetActive,
    TarjetaCreditoModel? target,
  }) => PaymentState(
    amountPay : amountPay ?? this.amountPay,
    coin      : coin ?? this.coin,
    target    : target ?? this.target,
    isTargetActive  : isTargetActive ?? this.isTargetActive,
  ); 
}
