import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis_clone/core/config/custom_http_client.dart';
import 'package:guia_de_moteis_clone/core/utils/constants.dart';
import 'package:guia_de_moteis_clone/data/datasources/motel_remote_data_source.dart';
import 'package:guia_de_moteis_clone/data/repositories/motel_repository_impl.dart';
import 'package:guia_de_moteis_clone/domain/repositories/motel_repository.dart';
import 'package:guia_de_moteis_clone/domain/usecases/get_motels_usecase.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_bloc.dart';

class InjectionContainer {
  static late GetIt _i;
  static GetIt get instance => _i;

  InjectionContainer.setup() {
    _i = GetIt.I;

    _i.registerSingleton<CustomHttpClient>(
      CustomHttpClient(
        baseUrl: AppConstants.baseUrl,
      ),
    );

    ///Datasourses
    _i.registerLazySingleton<MotelRemoteDataSource>(
      () => MotelRemoteDataSource(
        client: _i<CustomHttpClient>(),
      ),
    );

    ///Repositories
    _i.registerLazySingleton<MotelRepository>(
      () => MotelRepositlryImpl(
        motelDataSource: _i<MotelRemoteDataSource>(),
      ),
    );

    ///UseCases
    _i.registerLazySingleton<GetMotelsUseCase>(
      () => GetMotelsUseCase(
        repository: _i<MotelRepository>(),
      ),
    );

    ///Blocs
    _i.registerFactory<MotelBloc>(
      () => MotelBloc(
        getMotelsUseCase: _i<GetMotelsUseCase>(),
      ),
    );
  }
}
