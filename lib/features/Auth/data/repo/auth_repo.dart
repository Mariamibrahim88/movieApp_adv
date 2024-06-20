import 'package:dartz/dartz.dart';
import 'package:movie_app_adv/features/Auth/data/model/sign_up_model.dart';

import '../../../../core/error/failure.dart';
import '../model/sign_in_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignInModel>> signIn(String email, String password);
  Future<Either<Failure, SignUpModel>> signUp(
      String email, String password, String name, int age);
}
