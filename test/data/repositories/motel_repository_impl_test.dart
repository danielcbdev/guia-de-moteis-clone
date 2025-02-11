import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:guia_de_moteis_clone/data/datasources/motel_remote_data_source.dart';
import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';
import 'package:guia_de_moteis_clone/data/repositories/motel_repository_impl.dart';
import 'package:guia_de_moteis_clone/core/errors/failure.dart';

import 'motel_repository_impl_test.mocks.dart';

@GenerateMocks([MotelRemoteDataSource])
void main() {
  late MotelRepositlryImpl repository;
  late MockMotelRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockMotelRemoteDataSource();
    repository = MotelRepositlryImpl(motelDataSource: mockDataSource);
  });

  group('MotelRepositlryImpl', () {
    test('should return MotelsResponseModel when the data source call is successful', () async {
      // Arrange
      final jsonData = {
        "sucesso": true,
        "data": {
          "pagina": 1,
          "qtdPorPagina": 10,
          "totalSuites": 5,
          "totalMoteis": 2,
          "raio": 15,
          "maxPaginas": 3.0,
          "moteis": []
        },
        "mensagem": ["Success"]
      };

      when(mockDataSource.getMotels()).thenAnswer((_) async => jsonData);

      // Act
      final result = await repository.getMotels();

      // Assert
      expect(result, isA<MotelsResponseModel>());
      expect(result.sucesso, true);
      expect(result.data?.pagina, 1);
      verify(mockDataSource.getMotels()).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should throw an exception when the data source call fails', () async {
      // Arrange
      when(mockDataSource.getMotels()).thenThrow(ServerFailure('Failed to fetch data'));

      // Act & Assert
      expect(() => repository.getMotels(), throwsA(isA<ServerFailure>()));
      verify(mockDataSource.getMotels()).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
