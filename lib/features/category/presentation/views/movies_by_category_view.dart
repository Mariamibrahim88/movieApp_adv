import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_adv/core/utils/functions/spacing.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';
import 'package:movie_app_adv/features/category/data/model/category_model.dart';
import 'package:movie_app_adv/features/category/presentation/manager/cubit/get_category_cubit.dart';
import 'package:movie_app_adv/features/category/presentation/views/widgets/movies_by_category_builder.dart';

class MoviesByCategoryView extends StatelessWidget {
  const MoviesByCategoryView({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetCategoryCubit>(context)
        .getMoviesByCategory(id: categoryModel.id);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 12),
                child: Text(
                  'Movies',
                  style: Styles.textStyle30,
                ),
              ),
              verticalSpace(15),
              const Expanded(child: MovieCardBuilderByCategories()),
            ],
          ),
        ),
      ),
    );
  }
}
