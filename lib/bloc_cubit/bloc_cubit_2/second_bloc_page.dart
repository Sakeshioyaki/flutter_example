import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/bloc_cubit/bloc_cubit_2/second_bloc_cubit.dart';

class SecondBlocPage extends StatefulWidget {
  const SecondBlocPage({Key? key}) : super(key: key);

  @override
  State<SecondBlocPage> createState() => _SecondBlocChildPageState();
}

class _SecondBlocChildPageState extends State<SecondBlocPage> {
  late final SecondBlocCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SecondBlocCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<SecondBlocCubit, SecondBlocState>(
          bloc: _cubit,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('this is second couter ${state.secondCounter}'),
                TextButton(
                  onPressed: () {
                    _cubit.createCounter();
                  },
                  child: const Text('PRESS TO CREATE SOME TEXT'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
