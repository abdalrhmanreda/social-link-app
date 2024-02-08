import 'package:equatable/equatable.dart';

class CounterModel extends Equatable {
  final double count;
  final String textWantCount;

  const CounterModel({required this.count, required this.textWantCount});

  @override
  // TODO: implement props
  List<Object?> get props => [count, textWantCount];
}
