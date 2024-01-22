import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_event.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../Example1_Bloc_Counter/bloc/counter_state.dart';

class BlocListenerHomeScreen extends StatelessWidget {
  BlocListenerHomeScreen({super.key});
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
          BlocListener<CounterBloc, CounterState>(

            //so listenwhen is by default is true and when it is false we cannot make the bloc listeneer work 
            //in the example we have put a condition to make the bloclistener true on a special condition.
            //remeber when it false we cannot make the blocbuilder work
            listenWhen: (previous, current) {
              if (current.counter > 5) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              if (state.counter > 5) {
                final snackBar = SnackBar(
                    content: AwesomeSnackbarContent(
                        // color: Colors.transparent,

                        title: "Working !!",
                        message: "This is a bloc Listener !",
                        contentType: ContentType.failure));
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
            child: Text("failed"),
          ),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
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
