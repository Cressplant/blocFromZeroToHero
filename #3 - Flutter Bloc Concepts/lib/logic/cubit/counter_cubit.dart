import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'internet_cubit.dart';
import 'internet_cubit.dart';
import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;

  CounterCubit({@required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    monitorInternetCubit();
  }

  void monitorInternetCubit() {
    internetStreamSubscription = internetCubit.listen((internetState) {
      if (internetState is InternetConnected) {
        increment();
      } else if (internetState is InternetDisconnected) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
