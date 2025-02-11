import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';
import 'package:guia_de_moteis_clone/domain/repositories/motel_repository.dart';
import 'package:guia_de_moteis_clone/domain/usecases/get_motels_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_motels_usecase_test.mocks.dart';

@GenerateMocks([MotelRepository])
void main() {
  late GetMotelsUseCase useCase;
  late MockMotelRepository mockRepository;

  setUp(() {
    mockRepository = MockMotelRepository();
    useCase = GetMotelsUseCase(repository: mockRepository);
  });

  group('GetMotelsUseCase', () {
    test('should return a list of motels when repository call is successful', () async {
      final expectedResponse = MotelsResponseModel();
      when(mockRepository.getMotels()).thenAnswer((_) async => expectedResponse);

      final result = await useCase.call();
      expect(result, expectedResponse);
      verify(mockRepository.getMotels()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should throw an exception when repository fails', () async {
      when(mockRepository.getMotels()).thenThrow(Exception('Failed to fetch motels'));

      expect(() => useCase.call(), throwsA(isA<Exception>()));
      verify(mockRepository.getMotels()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
