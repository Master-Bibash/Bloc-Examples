import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolatedHomeExample2Screen extends StatelessWidget {
  const IsolatedHomeExample2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isoloated"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
            ),
            CircularProgressIndicator(
              strokeAlign: 10,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  //without isolate
                  runHeavyTaskWithoutIsolate(400000000);


                  // final receivePort = ReceivePort();
                  // await Isolate.spawn(
                  //     runHeavyTaskWithIsolate, receivePort.sendPort);
                },
                child: Text("Run Heavy Task without isolate")),
                SizedBox(height: 10,),
                  ElevatedButton(
                onPressed: () async {
                  //with isolate
                  useIsolate();
               
                },
                child: Text("Run Heavy Task with isolate"))
          ],
        ),
      ),
    );
  }
}

runHeavyTaskWithoutIsolate(int count) {
  int value = 0;
  for (var i = 0; i < count; i++) {
    value += i;
  }
  print(value);
  return value;
}

int runHeavyTaskWithIsolate(List<dynamic>args ){
  SendPort resultPort=args[0];
  int value=0;
  for (var i = 0; i < args[1]; i++) {
    value+=i;
   
    
  }
   Isolate.exit(resultPort,value);
}

//withisolate
useIsolate() async {
  final ReceivePort receivePort = ReceivePort();

  try {
    await Isolate.spawn(runHeavyTaskWithIsolate,[receivePort.sendPort, 400000000]);
   
  } on Object {
    debugPrint('Isolate Failed');
    receivePort.close();
  }
  final response=await receivePort.first;
  print("result : $response");
  


   }

