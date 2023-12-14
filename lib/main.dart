import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagos_app/bloc/payment/payment_bloc.dart';
import 'package:pagos_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PaymentBloc())
      ],
      child: MaterialApp(
        title: 'pagosApp',
        initialRoute: 'home',
        routes: routes,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 31, 47, 84), 
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 22), 
            iconTheme: IconThemeData(color: Colors.white)
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}