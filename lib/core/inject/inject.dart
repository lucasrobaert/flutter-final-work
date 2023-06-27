import 'package:final_work/core/data/dio_http_service_imp.dart';
import 'package:final_work/core/domain/http_service.dart';
import 'package:final_work/data/datasources/get_movies_datasource.dart';
import 'package:final_work/data/datasources/local/get_movies_local_datasource_decorator_imp.dart';
import 'package:final_work/data/datasources/remote/get_movies_remote_datasource_imp.dart';
import 'package:final_work/data/repositories/get_movies_repository_imp.dart';
import 'package:final_work/domain/repositories/get_movies_repository.dart';
import 'package:final_work/domain/usecases/get_movies_usecase.dart';
import 'package:final_work/domain/usecases/get_movies_usecase_imp.dart';
import 'package:final_work/presentations/controller/movie_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void initialize() {
    GetIt getIt = GetIt.instance;
    // core
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    // datasources
    getIt.registerLazySingleton<GetMoviesDataSource>(
      () => GetMoviesLocalDataSourceDecoratorImp(
        GetMoviesRemoteDatasourceImp(getIt()),
      ),
    );
    // repositories
    getIt.registerLazySingleton<GetMoviesRepository>(
      () => GetMoviesRepositoryImp(getIt()),
    );
    // usecases
    getIt.registerLazySingleton<GetMoviesUseCase>(
      () => GetMoviesUseCaseImp(getIt()),
    );
    // controllers
    getIt.registerLazySingleton<MovieController>(
      () => MovieController(getIt()),
    );
  }
}
