import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_adv/features/Auth/data/model/sign_up_model.dart';
import 'package:movie_app_adv/features/Auth/data/repo/auth_repo.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(this.authRepo) : super(RegisterCubitInitial());

  final AuthRepo authRepo;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    emit(RegisterCubitLoading());
    final result = await authRepo.signUp(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      age: int.parse(ageController.text),
    );
    result.fold(
      (Failure) => emit(RegisterCubitFailure(Failure.message)),
      (SignUpModel) => emit(RegisterCubitSuccess()),
    );
  }
}
