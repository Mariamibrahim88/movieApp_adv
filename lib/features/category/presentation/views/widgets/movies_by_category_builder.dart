import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_adv/core/widgets/custom_error_message.dart';
import 'package:movie_app_adv/features/category/presentation/manager/cubit/get_category_cubit.dart';
import 'package:movie_app_adv/features/home/presentation/views/widgets/movies_card.dart';

class MovieCardBuilderByCategories extends StatelessWidget {
  const MovieCardBuilderByCategories({super.key});

  //MovieModel movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryCubit, GetCategoryState>(
        builder: (context, state) {
      if (state is GetMoviesByCategoriesSuccess) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.movies.length,
          itemBuilder: (context, index) {
            return MoviesCard(
              movies: state.movies[index],
            );
          },
        );
      } else if (state is GetMoviesByCategoriesFailure) {
        return CustomErorrMessage(errorMessage: state.message);
      } else {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.amber,
        ));
      }
    });

    // } else {
    //   return const Center(
    //       child: CircularProgressIndicator(
    //     valueColor: AlwaysStoppedAnimation(Colors.grey),
    //   ));
  }
}
