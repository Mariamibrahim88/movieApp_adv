import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            const TextSpan(
                text: 'Don\'t have an account?', style: Styles.textStyle18F),
            TextSpan(
              text: ' Sign Up',
              style: Styles.textStyle18gr,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  GoRouter.of(context).push('/registerView');
                },
            )
          ])),
    );
  }
}
