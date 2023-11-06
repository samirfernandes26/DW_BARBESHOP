import 'package:dw_barbershop/src/barbeshop_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const BarbeshopApp()));
}