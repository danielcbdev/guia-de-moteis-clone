import 'package:equatable/equatable.dart';

abstract class MotelEvent extends Equatable {
  const MotelEvent();

  @override
  List<Object> get props => [];
}

class FetchMotels extends MotelEvent {}
