import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_adv/features/Auth/data/model/sign_up_model.dart';
import 'package:movie_app_adv/features/Auth/data/repo/auth_repo.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(this.authRepo) : super(RegisterCubitInitial());

  final AuthRepo authRepo;

  signUp(String email, String password, String name, int age) async {
    emit(RegisterCubitLoading());
    final result = await authRepo.signUp(email, password, name, age);
    result.fold(
      (Failure) => emit(RegisterCubitFailure(Failure.message)),
      (SignUpModel) => emit(RegisterCubitSuccess()),
    );
  }
}
