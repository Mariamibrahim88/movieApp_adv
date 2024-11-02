import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app_adv/features/category/presentation/manager/cubit/get_category_cubit.dart';
import 'package:movie_app_adv/features/category/presentation/views/widgets/category_card.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryCubit, GetCategoryState>(
      builder: (context, state) {
        if (state is GetCategoryFailure) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is GetCategorySuccess) {
          return GridView.builder(
              itemCount: state.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.3),
              itemBuilder: (context, index) {
                return CategoryCard(
                  categoryModel: state.categories[index],
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
