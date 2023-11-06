import 'package:asyncstate/asyncstate.dart';
import 'package:dw_barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dw_barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbeshopApp extends StatelessWidget {
  const BarbeshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
        customLoader: const BarbershopLoader(),
        builder: (AsyncNavigatorObserver) {
          return MaterialApp(
            title: 'DW Barbershop',
            navigatorObservers: [AsyncNavigatorObserver],
            routes: {
              '/': (_) => const SplashPage(),
            },
          );
        });
  }
}