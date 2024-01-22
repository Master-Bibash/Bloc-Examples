import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_event.dart';
import 'package:flutter_application_1/Example/Example1_Bloc_Counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerHome extends StatelessWidget {
  BlocConsumerHome({super.key});
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
          //BlocConsumer is the combination of blocbuilder and bloclistener it means it has builder which buildes the widget and listerner which is like listenwhen (by default it it true if false the code within wont run)
          BlocConsumer<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                "Counter value : ${state.counter.toString()}",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              );
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
