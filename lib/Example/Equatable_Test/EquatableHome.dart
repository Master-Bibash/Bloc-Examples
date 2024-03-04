import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/CubitMain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquatableHome extends StatefulWidget {
  const EquatableHome({Key? key}) : super(key: key);

  @override
  State<EquatableHome> createState() => _EquatableHomeState();
}

class _EquatableHomeState extends State<EquatableHome> {
  late CounterCubit _counterCubit;

  @override
  void initState() {
    super.initState();
    _counterCubit = CounterCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Bloc.observer = SimpleBlocObserver();

             
            },
            child: Text("Increment"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
