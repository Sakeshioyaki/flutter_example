import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/bloc_cubit/bloc_cubit_2/second_bloc_cubit.dart';
import 'package:flutter_example/bloc_cubit/bloc_cubit_2/second_bloc_page.dart';
import 'package:flutter_example/bloc_cubit/my_bloc_cubit/my_bloc_state.dart';
import 'package:flutter_example/bloc_cubit/my_bloc_cubit/my_bloc_state_2.dart';

import 'my_bloc_cubit.dart';

class MyBlocArguments {
  String param;

  MyBlocArguments({
    required this.param,
  });
}

class MyBlocPage extends StatelessWidget {
  final MyBlocArguments? arguments;

  const MyBlocPage({
    Key? key,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MyBlocCubit();
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
  late final MyBlocCubit _cubit;
  late final SecondBlocCubit _cubit2;
  bool? selectTest;

  @override
  void initState() {
    super.initState();
    _cubit2 = BlocProvider.of(context);

    ///1 lan
    _cubit = BlocProvider.of(context);
    // _cubit = context.read<MyBlocCubit>();
    //
    // ///many time
    // _cubit = context.watch<MyBlocCubit>();
    // _cubit = BlocProvider.of<MyBlocCubit>(context, listen: true);
    //
    // //selector
    // selectTest = context.select((MyBlocCubit cubit) => cubit.state.count1 >= 3);
  }

  @override
  Widget build(BuildContext context) {
    print('REBUILD - ${Random().nextInt(100)}');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        //child: BlocBuilder<MyBlocCubit, MyBlocState>(
        //   bloc: _cubit,
        //   // buildWhen: (previousState, state) {
        //   //  return previousState.countRandom != state.countRandom;
        //   // },
        //   builder: (context, state) {
        //     return Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text('count 1:        ${state.count1}'),
        //         const SizedBox(height: 50),
        //         Text('count random:   ${state.countRandom}'),
        //       ],
        //     );
        //   },
        // ),
        child: BlocSelector<MyBlocCubit, MyBlocState, MyBlocState2>(
          selector: (state) {
            return state.count1 >= 3
                ? const MyBlocState2(something: 'ĐÂY CŨNG LÀ ÁNH THÔI')
                : const MyBlocState2(something: 'ĐÂY LÀ ÁNH');
          },
          builder: (context, value) {
            print('REBUILD - ${Random().nextInt(100)}');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('count 1:        ${value.something}'),
                const SizedBox(height: 50),
                Text('count random:   ${value.something}'),
                const SizedBox(height: 50),
                BlocBuilder<SecondBlocCubit, SecondBlocState>(
                  builder: (context, state) {
                    return Text(
                        'count from second page:   ${state.secondCounter}');
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondBlocPage()),
                    );
                  },
                  child: const Text('NAVIGATOR TO PAGE 2'),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _cubit.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.exposure_plus_1),
          ),
          const SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              _cubit.decrement();
            },
            tooltip: 'prople',
            child: const Icon(Icons.exposure_minus_1),
          ),
          const SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              _cubit.randomCount();
            },
            tooltip: 'prople',
            child: const Icon(Icons.square),
          ),
          const SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              _cubit2.increment();
            },
            tooltip: 'prople',
            child: const Icon(Icons.send_outlined),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
