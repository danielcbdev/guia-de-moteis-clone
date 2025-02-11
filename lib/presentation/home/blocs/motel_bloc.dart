import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_clone/domain/usecases/get_motels_usecase.dart';

import 'motel_event.dart';
import 'motel_state.dart';

class MotelBloc extends Bloc<MotelEvent, MotelState> {
  final GetMotelsUseCase getMotelsUseCase;

  MotelBloc({
    required this.getMotelsUseCase,
  }) : super(MotelInitialState()) {
    on<FetchMotels>((event, emit) async {
      emit(MotelLoadingState());
      try {
        final motelsResponse = await getMotelsUseCase();
        emit(MotelsLoadedState(motelsResponse));
      } catch (e) {
        emit(MotelErrorState(e.toString()));
      }
    });
  }
}
