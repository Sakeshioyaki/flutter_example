import 'package:equatable/equatable.dart';

class MyBlocState2 extends Equatable {
  final String something;
  const MyBlocState2({
    this.something = '',
  });

  @override
  List<Object?> get props => [
    something,
  ];

  MyBlocState2 copyWith({String? something}) {
    return MyBlocState2(
      something: something ?? this.something,
    );
  }
}
