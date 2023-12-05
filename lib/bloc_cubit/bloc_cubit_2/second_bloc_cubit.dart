import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'second_bloc_state.dart';

class SecondBlocCubit extends Cubit<SecondBlocState> {
  SecondBlocCubit() : super(const SecondBlocState());
}
