import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app_adv/core/utils/functions/launch_url.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';
import 'package:movie_app_adv/core/widgets/custom_error_message.dart';
import 'package:movie_app_adv/features/home/data/model/movie_model.dart';
import 'package:movie_app_adv/features/home/presentation/manager/Home_page_cubit/home_page_cubit.dart';

import '../../../../../core/utils/functions/spacing.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.movies});

  final MovieModel movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(builder: (context, state) {
      if (state is HomePageSuccess) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisSize: MainAxisSize.max,
            children: [
              verticalSpace(30),
              GestureDetector(
                onTap: () async {
                  launchCustomUrl(context, movies.video);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    //state.movies.
                    movies.image,
                    //"assets/movie3.png",
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              verticalSpace(10),
              Text(
                movies.name,
                // "harry potter",
                style: Styles.textStyle30,
                softWrap: true,
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.calendar,
                    color: Colors.white,
                    size: 20,
                  ),
                  horizontalSpace(10),

                  Text(movies.dateOfProduction),
                  //Text("2021", style: const TextStyle(color: Colors.white)),

                  horizontalSpace(20),
                  const Icon(FontAwesomeIcons.eye,
                      color: Colors.white, size: 20),
                  horizontalSpace(10),
                  Text(
                    movies.numberOfWatch.toString(),
                    //"100",

                    style: const TextStyle(color: Colors.white),
                  ),
                  horizontalSpace(20),
                  const Icon(FontAwesomeIcons.star,
                      color: Colors.yellow, size: 20),
                  horizontalSpace(10),
                  Text(
                    movies.rating,
                    //"4.5",

                    style: const TextStyle(color: Colors.white),
                  ),
                  horizontalSpace(20),
                  const Icon(FontAwesomeIcons.clock,
                      color: Colors.white, size: 20),
                  horizontalSpace(10),
                  Text(
                    movies.duration,
                    //"2h 30m",

                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(movies.description,
                  //"this is a movie about a ghhhh hgggg hhhhhhhhhhhh",
                  softWrap: true,
                  style: Styles.textStyle18F),
              //const SizedBox(height: 25),
              verticalSpace(25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(movies.author,
                    //"mariam",
                    style: Styles.textStyle18gr),
              ),
            ],
          ),
        );
      } else if (state is HomePageFailure) {
        return CustomErorrMessage(errorMessage: state.errMessage);
      } else {
        return const Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 110, 171, 112),
          ),
        );
      }
    });
  }
}
