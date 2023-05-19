import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:counter_bloc_app/app.dart';
import 'package:counter_bloc_app/counter_observer.dart';

void main() {
  CounterObserver observer = const CounterObserver();
  runApp(const CounterApp());
}
