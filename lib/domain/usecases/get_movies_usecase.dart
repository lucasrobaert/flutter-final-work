import 'package:dartz/dartz.dart';
import 'package:final_work/domain/entities/movie_entity.dart';

abstract class GetMoviesUseCase {
  Future<Either<Exception, MovieEntity>> call();
}
