import 'package:flutter/material.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Watching Now...',
              style: Styles.textStyle18,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
