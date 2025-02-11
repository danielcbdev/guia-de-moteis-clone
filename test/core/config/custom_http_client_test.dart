import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_clone/core/config/custom_http_client.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'custom_http_client_test.mocks.dart';

@GenerateMocks([IOClient]) // Agora geramos um mock de IOClient
void main() {
  late CustomHttpClient client;
  late MockIOClient mockHttpClient;

  const String baseUrl = "https://api.example.com";
  const String endpoint = "/test";

  setUp(() {
    mockHttpClient = MockIOClient();
    client = CustomHttpClient(baseUrl: baseUrl, httpClient: mockHttpClient);
  });

  group('CustomHttpClient', () {
    test('should return response when GET request is successful', () async {
      final expectedResponse = http.Response('{"message": "success"}', 200);
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer((_) async => expectedResponse);

      final response = await client.get(endpoint);

      expect(response.statusCode, 200);
      expect(response.body, '{"message": "success"}');
      verify(mockHttpClient.get(any, headers: anyNamed('headers'))).called(1);
    });

    test('should return response with status code 500 when the server fails', () async {
      final expectedResponse = http.Response('Internal Server Error', 500);
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer((_) async => expectedResponse);

      final response = await client.get(endpoint);

      expect(response.statusCode, 500);
      expect(response.body, 'Internal Server Error');
      verify(mockHttpClient.get(any, headers: anyNamed('headers'))).called(1);
    });

    test('should throw a SocketException when GET request fails due to network error', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenThrow(SocketException('No Internet'));

      await expectLater(
        client.get(endpoint),
        throwsA(isA<SocketException>()),
      );

      verify(mockHttpClient.get(any, headers: anyNamed('headers'))).called(1);
    });

    test('should use the default _createHttpClient() when no httpClient is provided', () async {
      final defaultClient = CustomHttpClient(baseUrl: baseUrl);

      expect(defaultClient.httpClient, isA<IOClient>());
    });
  });
}
