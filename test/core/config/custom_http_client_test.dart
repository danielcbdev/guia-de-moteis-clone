import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:guia_de_moteis_clone/core/config/custom_http_client.dart';

import 'custom_http_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late CustomHttpClient client;
  late MockClient mockHttpClient;

  const String baseUrl = "https://api.example.com";
  const String endpoint = "/test";

  setUp(() {
    mockHttpClient = MockClient();
    client = CustomHttpClient(baseUrl: baseUrl, httpClient: mockHttpClient);
  });

  group('CustomHttpClient', () {
    test('should return response when GET request is successful', () async {
      // Arrange
      final expectedResponse = http.Response('{"message": "success"}', 200);
      when(mockHttpClient.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => expectedResponse);

      // Act
      final response = await client.get(endpoint);

      // Assert
      expect(response.statusCode, 200);
      expect(response.body, '{"message": "success"}');
      verify(mockHttpClient.get(Uri.parse('$baseUrl$endpoint'), headers: anyNamed('headers'))).called(1);
    });

    test('should return response with status code 500 when the server fails', () async {
      // Arrange
      final expectedResponse = http.Response('Internal Server Error', 500);
      when(mockHttpClient.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => expectedResponse);

      // Act
      final response = await client.get(endpoint);

      // Assert
      expect(response.statusCode, 500);
      expect(response.body, 'Internal Server Error');
      verify(mockHttpClient.get(Uri.parse('$baseUrl$endpoint'), headers: anyNamed('headers'))).called(1);
    });

    test('should throw a SocketException when GET request fails due to network error', () async {
      // Arrange
      when(mockHttpClient.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: anyNamed('headers'),
      )).thenThrow(SocketException('No Internet'));

      // Act & Assert
      expect(() async => await client.get(endpoint), throwsA(isA<SocketException>()));

      // Verify that the mocked method was actually called
      verify(mockHttpClient.get(Uri.parse('$baseUrl$endpoint'), headers: anyNamed('headers'))).called(1);
    });
  });

  group('CustomHttpOverrides', () {
    test('should allow bad SSL certificates', () {
      // Arrange
      final overrides = CustomHttpOverrides();
      HttpOverrides.global = overrides;

      // Act
      final httpClient = overrides.createHttpClient(null);

      // Assert
      expect(
        () => httpClient.getUrl(Uri.parse('https://self-signed.badssl.com')),
        returnsNormally,
      );
    });
  });
}
