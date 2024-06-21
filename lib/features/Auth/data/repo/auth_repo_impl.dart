import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_adv/core/error/failure.dart';
import 'package:movie_app_adv/core/utils/functions/api_service.dart';
import 'package:movie_app_adv/features/Auth/data/model/sign_in_model.dart';
import 'package:movie_app_adv/features/Auth/data/model/sign_up_model.dart';
import 'package:movie_app_adv/features/Auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SignInModel>> signIn(
      {required String email, required String password}) async {
    try {
      final response = await apiService.post('/signin', {
        'email': email,
        'password': password,
      });
      final user = SignInModel.fromJson(response);
      return Right(user);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
        // TODO
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignUpModel>> signUp(
      {required String email,
      required String password,
      required String name,
      required int age}) async {
    try {
      final response = await apiService.post('/signup', {
        'email': email,
        'password': password,
        'name': name,
        'age': age,
      });
      final user = SignUpModel.fromJson(response);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
        // TODO
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
