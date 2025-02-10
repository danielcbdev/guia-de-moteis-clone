import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis_clone/core/config/custom_http_client.dart';
import 'package:guia_de_moteis_clone/core/utils/constants.dart';

class InjectionContainer {
  static late GetIt _i;
  static GetIt get instance => _i;

  InjectionContainer.setup() {
    _i = GetIt.I;

    _i.registerSingleton<CustomHttpClient>(CustomHttpClient(baseUrl: AppConstants.baseUrl));
  }
}
