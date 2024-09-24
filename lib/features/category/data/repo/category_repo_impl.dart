import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_adv/core/error/failure.dart';
import 'package:movie_app_adv/core/utils/functions/api_service.dart';
import 'package:movie_app_adv/features/category/data/model/category_model.dart';
import 'package:movie_app_adv/features/category/data/repo/category_repo.dart';
import 'package:movie_app_adv/features/home/data/model/movie_model.dart';

class CategoryRepoImpl extends CategoryRepo {
  final ApiService apiService;

  CategoryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      var returnedData = await apiService.get(endPoint: '/categories');

      List<CategoryModel> categories = [];

      for (var i = 0; i < returnedData.length; i++) {
        categories.add(CategoryModel.fromJson(returnedData[i]));
      }
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
      // TODO
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getMoviesByCategories(
      {required String id}) async {
    try {
      var response = await apiService.get(endPoint: '/categories/$id/movies');
      List<MovieModel> movies = [];
      for (var i = 0; i < response.length; i++) {
        movies.add(MovieModel.fromJson(response[i]));
      }
      return Right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
