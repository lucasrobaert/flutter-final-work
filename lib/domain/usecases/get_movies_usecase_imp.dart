import 'package:dartz/dartz.dart';
import 'package:final_work/domain/entities/movie_entity.dart';
import 'package:final_work/domain/repositories/get_movies_repository.dart';
import 'package:final_work/domain/usecases/get_movies_usecase.dart';

class GetMoviesUseCaseImp implements GetMoviesUseCase {
  final GetMoviesRepository repository;
  GetMoviesUseCaseImp(this.repository);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    return await repository();
  }
}
