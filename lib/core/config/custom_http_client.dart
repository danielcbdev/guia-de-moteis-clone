import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomHttpClient {
  final String baseUrl;

  CustomHttpClient({required this.baseUrl});

  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      _logRequest('GET', url, headers: headers);
      final response = await http.get(
        url,
        headers: headers,
      );
      _logResponse(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  void _logRequest(
    String method,
    Uri url, {
    Map<String, String>? headers,
    dynamic body,
  }) {
    debugPrint('----- REQUEST -----');
    debugPrint('Método: $method');
    debugPrint('URL: $url');
    if (headers != null) debugPrint('Headers: $headers');
    if (body != null) debugPrint('Body: ${json.encode(body)}');
    debugPrint('-------------------');
  }

  void _logResponse(http.Response response) {
    debugPrint('----- RESPONSE -----');
    debugPrint('Status Code: ${response.statusCode}');
    debugPrint('Body: ${response.body}');
    debugPrint('--------------------');
  }
}

class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
