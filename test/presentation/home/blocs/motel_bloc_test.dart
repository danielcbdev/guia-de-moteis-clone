import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';
import 'package:guia_de_moteis_clone/domain/usecases/get_motels_usecase.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_bloc.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_event.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'motel_bloc_test.mocks.dart';

@GenerateMocks([GetMotelsUseCase])
void main() {
  late MotelBloc bloc;
  late MockGetMotelsUseCase mockGetMotelsUseCase;

  setUp(() {
    mockGetMotelsUseCase = MockGetMotelsUseCase();
    bloc = MotelBloc(getMotelsUseCase: mockGetMotelsUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  group('MotelBloc', () {
    test('initial state should be MotelInitialState', () {
      expect(bloc.state, isA<MotelInitialState>());
    });

    blocTest<MotelBloc, MotelState>(
      'should emit [MotelLoadingState, MotelsLoadedState] when FetchMotels is added and succeeds',
      build: () {
        final response = MotelsResponseModel(sucesso: true, data: null, mensagem: ["Success"]);
        when(mockGetMotelsUseCase()).thenAnswer((_) async => response);
        return bloc;
      },
      act: (bloc) => bloc.add(FetchMotels()),
      expect: () => [
        isA<MotelLoadingState>(),
        isA<MotelsLoadedState>().having((state) => state.motelsResponse.sucesso, 'sucesso', true),
      ],
      verify: (_) {
        verify(mockGetMotelsUseCase()).called(1);
      },
    );

    blocTest<MotelBloc, MotelState>(
      'should emit [MotelLoadingState, MotelErrorState] when FetchMotels fails',
      build: () {
        when(mockGetMotelsUseCase()).thenThrow(Exception("Failed to fetch motels"));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchMotels()),
      expect: () => [
        isA<MotelLoadingState>(),
        isA<MotelErrorState>().having((state) => state.message, 'message', contains("Failed to fetch motels")),
      ],
      verify: (_) {
        verify(mockGetMotelsUseCase()).called(1);
      },
    );
  });
}
