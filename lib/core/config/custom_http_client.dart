import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomHttpClient {
  final String baseUrl;

  CustomHttpClient({required this.baseUrl});

  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    _logRequest('GET', url, headers: headers);
    final response = await http.get(url, headers: headers);
    _logResponse(response);
    return response;
  }

  Future<http.Response> post(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    _logRequest('POST', url, headers: headers, body: body);
    final response = await http.post(
      url,
      headers: headers,
      body: body != null ? json.encode(body) : null,
    );
    _logResponse(response);
    return response;
  }

  Future<http.Response> put(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    _logRequest('PUT', url, headers: headers, body: body);
    final response = await http.put(
      url,
      headers: headers,
      body: body != null ? json.encode(body) : null,
    );
    _logResponse(response);
    return response;
  }

  Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    _logRequest('DELETE', url, headers: headers, body: body);

    final request = http.Request('DELETE', url);
    if (headers != null) {
      request.headers.addAll(headers);
    }
    if (body != null) {
      request.body = json.encode(body);
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    _logResponse(response);
    return response;
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
