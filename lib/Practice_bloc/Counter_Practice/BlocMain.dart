//Events are the inpu to the bloc
//They are commonly added in response to user interactions such as button presses or lifecycle events like page laoded

//Bloc requires us to register event handlers via the on<Event> API, as opposed to functions in Cubit
//An event handler is responsible for converting any incoming events into zero or more outgoing states.
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CounterEvent {}

final class CounterIncrementEvent extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0){
    on<CounterIncrementEvent>((event, emit) {
      emit(state+1);
    });
  }
}
