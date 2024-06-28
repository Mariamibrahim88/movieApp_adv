import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_adv/core/widgets/custom_error_message.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/login_view.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/register_view.dart';
import 'package:movie_app_adv/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_app_adv/features/home/presentation/manager/Home_page_cubit/home_page_cubit.dart';
import 'package:movie_app_adv/features/home/presentation/views/details_view.dart';
import 'package:movie_app_adv/features/home/presentation/views/home_view.dart';
import 'package:movie_app_adv/features/splash/presentation/views/splash_view.dart';

import '../../../features/home/data/model/movie_model.dart';
import 'service_locator.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/loginView',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/registerView',
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: '/detailsView',
      builder: (context, state) {
        final movie = state.extra as MovieModel;

        return BlocProvider(
          create: (context) => HomePageCubit(
              getIt.get<HomeRepoImpl>()..getMoviesById(id: movie.id)),
          child: DetailsView(
            movies: state.extra as MovieModel,
          ),
        );
      },
    ),

    //  const DetailsView(
    //   //bookModel: state.extra as BookModel,
    //   movies: state.extra as MovieModel,
    // ),
  ]);
}
