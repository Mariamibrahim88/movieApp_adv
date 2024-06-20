import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_adv/features/Auth/data/repo/auth_repo.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../data/model/sign_in_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  signIn(String email, String password) async {
    emit(LoginInLoading());
    final result = await authRepo.signIn(email, password);

    result.fold(
      (Failure) => emit(LoginInFailure(Failure.message)),
      (SignInModel) => emit(LoginInSuccess()),
    );
  }
}
