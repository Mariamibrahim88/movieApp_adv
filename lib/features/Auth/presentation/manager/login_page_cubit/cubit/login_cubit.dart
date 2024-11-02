import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_adv/core/database/cached_helper.dart';
import 'package:movie_app_adv/core/utils/functions/service_locator.dart';
import 'package:movie_app_adv/features/Auth/data/model/sign_in_model.dart';
import 'package:movie_app_adv/features/Auth/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    emit(LoginInLoading());
    final result = await authRepo.signIn(
        email: emailController.text, password: passwordController.text);
    await getIt<CacheHelper>()
        .saveData(key: 'email', value: emailController.text);

    result.fold(
      (Failure) => emit(LoginInFailure(Failure.message)),
      (SignInModel) => emit(LoginInSuccess()),
    );
  }
}
