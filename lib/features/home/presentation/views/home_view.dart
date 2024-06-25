import 'package:flutter/material.dart';
import 'package:movie_app_adv/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:movie_app_adv/features/home/presentation/views/widgets/movie_card_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeViewBody());
  }
}
