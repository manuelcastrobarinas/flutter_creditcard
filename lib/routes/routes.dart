import 'package:flutter/material.dart';
import 'package:pagos_app/pages/home/home_page.dart';
import 'package:pagos_app/pages/payments/payments_complete.dart';
import 'package:pagos_app/pages/targets/targets_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
 'home' : (_) => const HomePage(),
 'paymentComplete' : (_) => const PaymentsCompletePage(),
 'targets' : (_) => const TargetsPage(),
};