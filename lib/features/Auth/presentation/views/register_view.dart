import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_adv/core/utils/functions/service_locator.dart';
import 'package:movie_app_adv/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:movie_app_adv/features/Auth/presentation/manager/register_page_cubit/register_cubit_cubit.dart';

import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
        child: RigesterViewBody(),
      ),
    );
  }
}
