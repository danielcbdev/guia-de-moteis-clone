import 'package:equatable/equatable.dart';
import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';

abstract class MotelState extends Equatable {
  const MotelState();

  @override
  List<Object?> get props => [];
}

class MotelInitialState extends MotelState {}

class MotelLoadingState extends MotelState {}

class MotelsLoadedState extends MotelState {
  final MotelsResponseModel motelsResponse;

  const MotelsLoadedState(this.motelsResponse);

  @override
  List<Object?> get props => [motelsResponse];
}

class MotelErrorState extends MotelState {
  final String message;

  const MotelErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
