import 'package:final_work/domain/entities/movie_details_entity.dart';
import 'package:final_work/domain/entities/movie_entity.dart';
import 'package:final_work/domain/usecases/get_movies_usecase.dart';
import 'package:final_work/presentations/dtos/movie_dto.dart';
import 'package:flutter/material.dart';

class MovieController {
  final GetMoviesUseCase _getMoviesUseCase;
  MovieController(this._getMoviesUseCase) {
    fetch();
  }

  ValueNotifier<MovieEntity?> movies = ValueNotifier<MovieEntity?>(null);
  MovieEntity? _cachedMovies;

  onChanged(String value) {
    List<MovieDetailsEntity> list = _cachedMovies!.listMovies
        .where(
          (e) => e.toString().toLowerCase().contains((value.toLowerCase())),
        )
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetch() async {
    var result = await _getMoviesUseCase();

    result.fold(
      (error) => debugPrint(error.toString()),
      (success) => movies.value = success,
    );

    _cachedMovies = movies.value;
  }
}
