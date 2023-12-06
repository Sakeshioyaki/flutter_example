import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_example/provider/my_provider_controller.dart';
import 'package:flutter_example/provider/my_provider_controller2.dart';
import 'package:provider/provider.dart';

class MyProviderPage extends StatelessWidget {
  const MyProviderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) {
    //     return MyProviderController();
    //   },
    //   child: const MyBlocChildPage(),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProviderController>(
          create: (_) => MyProviderController(),
        ),
        // because chill need listenable value in myProvider2, so i need using subtype of Listenable/Stream. Do not use Provider<T>() instead
        ChangeNotifierProvider<MyProviderController2>(
          create: (_) => MyProviderController2(),
        ),
        //
      ],
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
  late final MyProviderController2 _controller2;
  @override
  void initState() {
    super.initState();
    _controller = context.read<MyProviderController>();
    _controller2 = context.read<MyProviderController2>();
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          /// ListenableProvider
          /// ChangeNotifierProvider
          /// ValueListenableProvider
          /// StreamProvider
          /// FutureProvider
          // child: Row(
          //   children: [
          //     Consumer<MyProviderController>(
          //       builder: (context, controller, child) {
          //         return Flexible(
          //           child: ListView.builder(
          //             itemCount: _controller.items.length,
          //             itemBuilder: (context, index) {
          //               return Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                   vertical: 8,
          //                   horizontal: 20,
          //                 ),
          //                 child: Text("$index : ${_controller.items[index]}"),
          //               );
          //             },
          //           ),
          //         );
          //       },
          //     ),
          //     Consumer<MyProviderController2>(
          //       builder: (context, controller2, child) {
          //         return Flexible(
          //           child: ListView.builder(
          //             itemCount: _controller2.items.length,
          //             itemBuilder: (context, index) {
          //               return Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                   vertical: 8,
          //                   horizontal: 20,
          //                 ),
          //                 child: Text("$index : ${_controller2.items[index]}"),
          //               );
          //             },
          //           ),
          //         );
          //       },
          //     ),
          //   ],
          // ),
          child: Consumer2<MyProviderController, MyProviderController2>(
            builder: (BuildContext context, MyProviderController controller1,
                MyProviderController2 controller2, Widget? child) {
              return Row(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: controller1.items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 20,
                          ),
                          child: Text("$index : ${controller1.items[index]}"),
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: controller2.items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 20,
                          ),
                          child: Text("$index : ${controller2.items[index]}"),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
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
          const SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              _controller2.randomBool();
            },
            tooltip: 'prople',
            child: const Icon(Icons.diamond_outlined),
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
