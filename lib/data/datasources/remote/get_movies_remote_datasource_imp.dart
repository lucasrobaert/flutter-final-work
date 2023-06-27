import 'package:dartz/dartz.dart';
import 'package:final_work/core/domain/http_service.dart';
import 'package:final_work/core/utils/api_utils.dart';
import 'package:final_work/data/datasources/get_movies_datasource.dart';
import 'package:final_work/data/dtos/movie_dto.dart';
import 'package:final_work/domain/entities/movie_entity.dart';

class GetMoviesRemoteDatasourceImp implements GetMoviesDataSource {
  final HttpService _httpService;
  GetMoviesRemoteDatasourceImp(this._httpService);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      var result = await _httpService.get(API.REQUEST_MOVIE_LIST);
      return Right(MovieDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception("Falha no datasource"));
    }
  }
}
