import 'package:flutter/material.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/HomeScreen.dart';
import 'package:flutter_application_1/Example/Example3_Bloc_Consumer/BlocConsumerHome.dart';
import 'package:flutter_application_1/Example/Example2_Bloc_Listener/BlocListenerHome.dart';
import 'package:flutter_application_1/Isolate/Example1/HomePageIsolate.dart';
import 'package:flutter_application_1/Isolate/Example2/Example2IsolatedHome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Example/Example4_Bloc_Selector/BlocSelectorHomeScreen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: IsolatedHomeExample2Screen(),
        ));
  }
}
