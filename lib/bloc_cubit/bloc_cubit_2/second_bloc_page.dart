import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'second_bloc_cubit.dart';

class SecondBlocArguments {
  String param;

  SecondBlocArguments({
    required this.param,
  });
}

class SecondBlocPage extends StatelessWidget {
  final SecondBlocArguments arguments;

  const SecondBlocPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SecondBlocCubit();
      },
      child: const SecondBlocChildPage(),
    );
  }
}

class SecondBlocChildPage extends StatefulWidget {
  const SecondBlocChildPage({Key? key}) : super(key: key);

  @override
  State<SecondBlocChildPage> createState() => _SecondBlocChildPageState();
}

class _SecondBlocChildPageState extends State<SecondBlocChildPage> {
  late final SecondBlocCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Container();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
