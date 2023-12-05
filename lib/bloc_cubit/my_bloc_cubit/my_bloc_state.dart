import 'package:equatable/equatable.dart';

class MyBlocState extends Equatable {
  final int count1;
  final int countRandom;
  const MyBlocState({
    this.count1 = 0,
    this.countRandom = 0,
  });

  @override
  List<Object?> get props => [
        count1,
        countRandom,
      ];

  MyBlocState copyWith({int? count1, int? countRandom}) {
    return MyBlocState(
      count1: count1 ?? this.count1,
      countRandom:countRandom ?? this.countRandom,
    );
  }
}
