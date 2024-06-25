import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_adv/core/utils/functions/show_snack_bar.dart';
import 'package:movie_app_adv/core/widgets/custom_error_message.dart';
import 'package:movie_app_adv/features/home/data/model/movie_model.dart';
import 'package:movie_app_adv/features/home/presentation/manager/Home_page_cubit/home_page_cubit.dart';
import 'package:movie_app_adv/features/home/presentation/views/widgets/movies_card.dart';

class MovieCardBuilder extends StatelessWidget {
  MovieCardBuilder({super.key});

  //MovieModel movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(builder: (context, state) {
      if (state is HomePageSuccess) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.movies.length,
          itemBuilder: (context, index) {
            return MoviesCard(
              movies: state.movies[index],
            );
          },
        );
      } else if (state is HomePageFailure) {
        return CustomErorrMessage(errorMessage: state.errMessage);
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
