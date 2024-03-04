import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/CubitMain.dart';
import 'package:flutter_application_1/Example/Equatable_Test/EquatableHome.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
 
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: EquatableHome(),
        ));
  }
}
