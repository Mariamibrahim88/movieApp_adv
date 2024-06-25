import 'package:dartz/dartz.dart';
import 'package:movie_app_adv/core/error/failure.dart';
import 'package:movie_app_adv/features/home/data/model/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> getAllMovies();
}
