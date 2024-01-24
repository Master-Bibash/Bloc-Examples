import 'package:flutter/material.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_event.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSelectorHomeScreen extends StatelessWidget {
  BlocSelectorHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocSelector<CounterBloc, CounterState, bool>(
            selector: (state) => state.counter >= 2 ? true : false,
            builder: (context, state) {
              return Center(
                child: Container(
                  width: 200,
                  height: 200,
                  color: state? Colors.green:Colors.red,
                ),
              );
            },
          ),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<CounterBloc, CounterState>(
              //so Blocbuilder only word when it is set true when the buildwhen is false then the state.counter will not get update
              //so we can either add an condtion when the state is true or other
              buildWhen: (previous, current) {
                // print(previous.counter);
                // print(current.counter);
                return true;
              },
              builder: (context, state) {
                // print("called");
                return Text(
                  "Counter value : ${state.counter}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                );
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton.icon(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterDecrementEvent());
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Decrease",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 30),
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton.icon(
                    onPressed: () {
                      // print(context.read<CounterBloc>().state.counterValue);
                      context.read<CounterBloc>().add(CounterIncrementEvent());
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Increase",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
