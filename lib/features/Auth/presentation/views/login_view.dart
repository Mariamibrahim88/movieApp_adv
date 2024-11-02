import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_adv/core/utils/functions/service_locator.dart';
import 'package:movie_app_adv/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:movie_app_adv/features/Auth/presentation/manager/login_page_cubit/cubit/login_cubit.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        child: LoginViewBody(),
      ),
    );
  }
}
