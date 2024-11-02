import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_adv/core/database/cached_helper.dart';
import 'package:movie_app_adv/core/utils/functions/service_locator.dart';
import 'package:movie_app_adv/features/splash/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome(); //single responsibility principle
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/movie3.png',
            width: 250,
            height: 100,
          ),
          const SizedBox(height: 10),
          SlidingText(slidingAnimation: slidingAnimation),
        ]);
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 0),
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () async {
      // Get.to(() => const HomeView(),
      //     transition: Transition.fadeIn, duration: KTransitionDuration);

      final email = await getIt<CacheHelper>().getData(key: 'email');
      if (email != null) {
        GoRouter.of(context).push('/Nav'); // Navigate to home view
      } else {
        animationController.forward(); // Show sliding animation
        Future.delayed(const Duration(seconds: 1), () {
          GoRouter.of(context).push('/loginView'); // Navigate to login view
        });
      }
    });
  }
}
