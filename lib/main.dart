import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_adv/constants.dart';
import 'package:movie_app_adv/core/utils/functions/go_router.dart';
import 'package:movie_app_adv/core/utils/functions/service_locator.dart';
import 'package:movie_app_adv/features/Auth/presentation/manager/login_page_cubit/cubit/login_cubit.dart';
import 'package:movie_app_adv/features/Auth/presentation/manager/register_page_cubit/register_cubit_cubit.dart';
import 'package:movie_app_adv/features/category/data/repo/category_repo_impl.dart';
import 'package:movie_app_adv/features/category/presentation/manager/cubit/get_category_cubit.dart';
import 'package:movie_app_adv/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_app_adv/features/home/presentation/manager/Home_page_cubit/home_page_cubit.dart';

import 'features/Auth/data/repo/auth_repo_impl.dart';

void main() async {
  setupServiceLocator();
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (create) => RegisterCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (create) =>
              HomePageCubit(getIt.get<HomeRepoImpl>())..getAllMovies(),
        ),
        BlocProvider(
          create: (create) =>
              GetCategoryCubit(getIt.get<CategoryRepoImpl>())..getCategories(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: KprimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
