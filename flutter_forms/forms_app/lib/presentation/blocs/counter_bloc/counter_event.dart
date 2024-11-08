part of 'counter_bloc.dart';

abstract class CounterEvent {
  final int value;
  const CounterEvent({this.value = 0});
}

class CounterIncrease extends CounterEvent {
  // ignore: use_super_parameters
  const CounterIncrease({value = 0}) : super(value: value);
}

class CounterReset extends CounterEvent {}