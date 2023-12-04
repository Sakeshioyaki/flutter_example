import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_example/stream/my_stream_controller.dart';
import 'package:flutter_example/stream/stream_state.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  MyStreamController myStreamController = MyStreamController();
  late StreamSubscription<int> sub;
  int subCount = 0;

  @override
  void initState() {
    super.initState();
    sub = myStreamController.countStreamSub.listen((event) {
      print('using yeild');
      setState(() {
        subCount = event;
      });
    });
  }

  @override
  void dispose() {
    myStreamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('subCount - $subCount'),
            const SizedBox(height: 50),
            StreamBuilder<int>(
              stream: myStreamController.counterStream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text('counter is ${snapshot.data}');
              },
            ),
            const SizedBox(height: 50),
            StreamBuilder<UserModal>(
              stream: myStreamController.userStream,
              builder:
                  (BuildContext context, AsyncSnapshot<UserModal> snapshot) {
                return Text('name is ${snapshot.data?.name}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              myStreamController.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              myStreamController.changeName();
            },
            tooltip: 'prople',
            child: const Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}
