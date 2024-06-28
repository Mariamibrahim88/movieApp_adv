import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_adv/features/home/data/model/movie_model.dart';
import 'package:movie_app_adv/features/home/presentation/manager/Home_page_cubit/home_page_cubit.dart';

import 'widgets/details_movie_view_body.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.movies});

  final MovieModel movies;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    BlocProvider.of<HomePageCubit>(context)
        .getMoviesById(id: widget.movies.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsViewBody(
        movies: widget.movies,
      ),
    );
  }
}
