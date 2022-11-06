import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final dynamic arg;

  const Params({required this.arg});

  @override
  List<Object?> get props => [arg];
}
