import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guia_de_moteis_clone/core/config/custom_http_client.dart';
import 'package:guia_de_moteis_clone/core/errors/failure.dart';

class MotelRemoteDataSource {
  final CustomHttpClient client;

  MotelRemoteDataSource({required this.client});

  Future<dynamic> getMotels() async {
    try {
      final response = await client.get('/b/1IXK');
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return data;
      } else {
        throw const ServerFailure('Erro ao carregar os motéis');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw const ServerFailure('Erro ao carregar os motéis');
    }
  }
}
