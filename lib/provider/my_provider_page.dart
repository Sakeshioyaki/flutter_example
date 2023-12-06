import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_example/provider/my_provider_controller.dart';
import 'package:provider/provider.dart';

class MyProviderPage extends StatelessWidget {
  const MyProviderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MyProviderController();
      },
      child: const MyBlocChildPage(),
    );
  }
}

class MyBlocChildPage extends StatefulWidget {
  const MyBlocChildPage({Key? key}) : super(key: key);

  @override
  State<MyBlocChildPage> createState() => _MyBlocChildPageState();
}

class _MyBlocChildPageState extends State<MyBlocChildPage> {
  late final MyProviderController _controller;
  @override
  void initState() {
    super.initState();
    _controller = context.read<MyProviderController>();
    //can't using "Provider.of<T>(context) == context.watch<T>()" outside of the build() method.
    // But if you still want to use it, then you need to set the listen parameter to false.
    // context.watch<T>(), which makes the widget listen to changes on T
    // context.read<T>(), which returns T without listening to it
    // context.select<T, R>(R cb(T value)), which allows a widget to listen to only a small part of T.
  }

  @override
  Widget build(BuildContext context) {
    print('REBUILD - ${Random().nextInt(100)}');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Consumer<MyProviderController>(
          builder: (context, controller, child) {
            return ListView.builder(
              itemCount: _controller.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: Text("$index : ${_controller.items[index]}"),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _controller.add();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.exposure_plus_1),
          ),
          const SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              _controller.removeAll();
            },
            tooltip: 'prople',
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
