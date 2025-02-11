import 'package:flutter/material.dart';
import 'package:guia_de_moteis_clone/data/datasources/motel_remote_data_source.dart';
import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';
import 'package:guia_de_moteis_clone/domain/repositories/motel_repository.dart';

class MotelRepositlryImpl extends MotelRepository {
  final MotelRemoteDataSource motelDataSource;

  MotelRepositlryImpl({required this.motelDataSource});

  @override
  Future<MotelsResponseModel> getMotels() async {
    try {
      final json = await motelDataSource.getMotels();

      return MotelsResponseModel.fromJson(json);
    } catch (e) {
      debugPrint('erro: $e');
      rethrow;
    }
  }
}
