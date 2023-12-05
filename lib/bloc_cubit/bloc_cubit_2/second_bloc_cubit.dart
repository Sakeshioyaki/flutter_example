import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'second_bloc_state.dart';

class SecondBlocCubit extends Cubit<SecondBlocState> {
  SecondBlocCubit() : super(const SecondBlocState());
  void createCounter() {
    var tmp = Random().nextInt(100);
    emit(state.copyWith(secondCounter: tmp));
  }

  void increment() {
    print('+1-second');
    emit(state.copyWith(secondCounter: state.secondCounter + 1));
  }
}
