import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/bloc_cubit/my_bloc_cubit/my_bloc_state.dart';

class MyBlocCubit extends Cubit<MyBlocState> {
  MyBlocCubit() : super(const MyBlocState());

  Future<void> loadInitialData() async {
    // emit(state.copyWith(loadDataStatus: LoadStatus.initial));
    // try {
    //   //Todo: add API calls
    //   emit(state.copyWith(loadDataStatus: LoadStatus.success));
    // } catch (e, s) {
    //   //Todo: should print exception here
    //   emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    // }
  }
  void increment() {
    print('+1');
    emit(state.copyWith(count1: state.count1! + 1));
  }

  void decrement() {
    print('-1');

    emit(state.copyWith(count1: state.count1! - 1));
  }

  void randomCount() {
    var tmp = Random().nextInt(100);
    emit(state.copyWith(countRandom: tmp));
  }
}
