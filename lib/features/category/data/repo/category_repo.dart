import 'package:dartz/dartz.dart';
import 'package:movie_app_adv/core/error/failure.dart';
import 'package:movie_app_adv/features/category/data/model/category_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}
