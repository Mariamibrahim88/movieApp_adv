import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_adv/core/utils/functions/service_locator.dart';
import 'package:movie_app_adv/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_app_adv/features/home/presentation/manager/Home_page_cubit/home_page_cubit.dart';

import 'package:movie_app_adv/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          HomePageCubit(getIt.get<HomeRepoImpl>())..getAllMovies(),
      child: HomeViewBody(),
    ));
  }
}
