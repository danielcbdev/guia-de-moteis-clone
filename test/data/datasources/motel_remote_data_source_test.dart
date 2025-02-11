import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:guia_de_moteis_clone/core/config/custom_http_client.dart';
import 'package:guia_de_moteis_clone/core/errors/failure.dart';
import 'package:guia_de_moteis_clone/data/datasources/motel_remote_data_source.dart';

import 'motel_remote_data_source_test.mocks.dart';

@GenerateMocks([CustomHttpClient])
void main() {
  late MotelRemoteDataSource dataSource;
  late MockCustomHttpClient mockClient;

  setUp(() {
    mockClient = MockCustomHttpClient();
    dataSource = MotelRemoteDataSource(client: mockClient);
  });

  group('MotelRemoteDataSource', () {
    const String endpoint = '/b/1IXK';

    test('should return data when the response status is 200', () async {
      final expectedData = {'motels': []};
      final response = http.Response(jsonEncode(expectedData), 200);
      when(mockClient.get(endpoint)).thenAnswer((_) async => response);

      final result = await dataSource.getMotels();

      expect(result, expectedData);
      verify(mockClient.get(endpoint)).called(1);
      verifyNoMoreInteractions(mockClient);
    });

    test('should throw ServerFailure when response status is not 200', () async {
      final response = http.Response('Server error', 500);
      when(mockClient.get(endpoint)).thenAnswer((_) async => response);

      expect(() => dataSource.getMotels(), throwsA(isA<ServerFailure>()));
      verify(mockClient.get(endpoint)).called(1);
      verifyNoMoreInteractions(mockClient);
    });

    test('should throw ServerFailure when an exception occurs', () async {
      when(mockClient.get(endpoint)).thenThrow(Exception('Connection failed'));

      expect(() => dataSource.getMotels(), throwsA(isA<ServerFailure>()));
      verify(mockClient.get(endpoint)).called(1);
      verifyNoMoreInteractions(mockClient);
    });
  });
}
