import 'package:flutter/material.dart';
import 'package:counter_bloc_app/counter/counter.dart';

import 'counter/view/counter_page.dart';

class CounterApp extends MaterialApp {
  @override
  // TODO: implement debugShowCheckedModeBanner
  bool get debugShowCheckedModeBanner => false;
  const CounterApp({super.key}) : super(home: const CounterPage());
}
