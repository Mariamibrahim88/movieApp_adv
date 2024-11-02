import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_adv/core/utils/functions/service_locator.dart';
import 'package:movie_app_adv/core/utils/functions/spacing.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';
import 'package:movie_app_adv/features/category/data/repo/category_repo_impl.dart';
import 'package:movie_app_adv/features/category/presentation/manager/cubit/get_category_cubit.dart';
import 'package:movie_app_adv/features/category/presentation/views/widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            GetCategoryCubit(getIt.get<CategoryRepoImpl>())..getCategories(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 12),
                child: Text(
                  'Categories',
                  style: Styles.textStyle30,
                ),
              ),
              verticalSpace(15),
              const Expanded(child: CategoryViewBody()),
            ],
          ),
        ),
      ),
    );
  }
}
