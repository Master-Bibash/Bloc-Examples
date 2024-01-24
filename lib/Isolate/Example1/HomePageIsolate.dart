import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageIsolate extends StatelessWidget {
  const HomePageIsolate({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/bouncing-ball.gif'),
              //Blocking UI task
              ElevatedButton(
                onPressed: () async {
                  var total = await complexTask1();
                  debugPrint('Result 1: $total');
                },
                child: const Text('Task 1'),
              ),
              SizedBox(
                height: 20,
              ),

              //Isolate
              ElevatedButton(
                onPressed: () async {
                  // print("object");
                  final receivePort = ReceivePort();
                  await Isolate.spawn(complexTask2, receivePort.sendPort);
                  receivePort.listen((total) {
                    debugPrint('Result 2: $total');
                  });
                },
                child: const Text('Task 2'),
              ),
              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () async {
                  final rece = ReceivePort();
                  await Isolate.spawn(complexTask2, rece.sendPort);
                },
                child: const Text('Task 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<double> complexTask1() async {
    var total = 0.0;
    for (var i = 0; i < 1000000000; i++) {
      total += i;
    }
    return total;
  }
}
//--End of HomePage--

complexTask2(SendPort sendPort) {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += i;
  }
  sendPort.send(total);
}
