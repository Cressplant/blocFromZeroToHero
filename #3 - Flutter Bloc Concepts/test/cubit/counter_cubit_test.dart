import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:test/test.dart';

import 'package:flutter_bloc_concepts/logic/cubit/internet_cubit.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;

    setUp(() {
      print('SETUP');
      counterCubit = CounterCubit(
          internetCubit: InternetCubit(
              connectivity: Connectivity())); // Initialise bloc/cubit
    });

    tearDown(() {
      print('TEARDOWN');
      counterCubit.close();
    });

// test(description, body)
    test(
        'the initial state for the CounterCubit is CounterState(counterValue: 0)',
        () {
// expect(actual, matcher) (matcher == expected value)
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
        'The cubit should emit a CounterState(counterValue: 1, wasIncremented: true) when cubit.increment() function is called.',
        build: () => counterCubit, // returns current instance being tested
        act: (cubit) => cubit.increment(), // action being applied to the cubit/bloc
        expect: [
          CounterState(counterValue: 1, wasIncremented: true)
        ] // list of expected results, ordered
        );

//! each test is called individually - setup, run, tearDown, repeat. Therefore each test should expect same initial value.

    blocTest(
        'The cubit should emit a CounterState(counterValue: 0, wasIncremented: false) when cubit.decrement() function is called.',
        build: () => counterCubit, // returns current instance being tested
        act: (cubit) => cubit.decrement(), // action being applied to the cubit/bloc
        expect: [
          CounterState(counterValue: -1, wasIncremented: false)
        ] // list of expected results, ordered
        );
  });
}
