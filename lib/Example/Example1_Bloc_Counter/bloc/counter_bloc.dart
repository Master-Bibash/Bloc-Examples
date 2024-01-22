import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_event.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    //after that
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementState(state.counter + 1));
    });
    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState(state.counter - 1));
    });
  }
}
