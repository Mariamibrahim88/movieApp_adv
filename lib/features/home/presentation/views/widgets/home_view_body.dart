import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app_adv/core/utils/functions/spacing.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';
import 'package:movie_app_adv/features/home/presentation/views/widgets/movie_card_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
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
            Expanded(child: MovieCardBuilder()),
          ],
        ),
      ),
    );
  }
}
