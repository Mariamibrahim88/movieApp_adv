import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_adv/core/error/failure.dart';
import 'package:movie_app_adv/core/utils/functions/api_service.dart';
import 'package:movie_app_adv/features/home/data/model/movie_model.dart';
import 'package:movie_app_adv/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> getAllMovies() async {
    try {
      var response = await apiService.get(endPoint: '/movies');

      List<MovieModel> movies = [];

      for (var i = 0; i < response.length; i++) {
        movies.add(MovieModel.fromJson(response[i]));
      }
      return Right(movies);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
      // TODO
    }
  }
}
