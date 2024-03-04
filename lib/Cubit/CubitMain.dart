import 'package:flutter_bloc/flutter_bloc.dart';

//input is our event
//state is our output
//we convert event to state
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void Increment() {
    addError(Exception('increment error'), StackTrace.current);
    emit(state + 1);
  }

  @override
  void onChnage(Change<int> change) {
    print("change is ${change}");
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error is the error and $stackTrace');
    super.onError(error, stackTrace);
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} and change is $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    print("${bloc.runtimeType} and $error $stacktrace");
    super.onError(bloc, error, stacktrace);
  }
}
