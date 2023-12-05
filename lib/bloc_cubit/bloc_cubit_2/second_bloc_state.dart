part of 'second_bloc_cubit.dart';

class SecondBlocState extends Equatable {
  final int secondCounter;
  const SecondBlocState({
    this.secondCounter = 0,
  });

  @override
  List<Object?> get props => [
        secondCounter,
      ];

  SecondBlocState copyWith({
    int? secondCounter,
  }) {
    return SecondBlocState(
      secondCounter: secondCounter ?? this.secondCounter,
    );
  }
}
