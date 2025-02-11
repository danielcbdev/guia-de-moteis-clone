import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';

abstract class MotelRepository {
  Future<MotelsResponseModel> getMotels();
}
