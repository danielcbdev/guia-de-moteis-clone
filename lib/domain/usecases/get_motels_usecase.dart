import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';
import 'package:guia_de_moteis_clone/domain/repositories/motel_repository.dart';

class GetMotelsUseCase {
  final MotelRepository repository;

  GetMotelsUseCase({required this.repository});

  Future<MotelsResponseModel> call() async {
    return await repository.getMotels();
  }
}
