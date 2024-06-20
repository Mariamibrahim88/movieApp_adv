import 'package:flutter/material.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';

class TermsAndConditionsTerm extends StatelessWidget {
  const TermsAndConditionsTerm({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(children: [
          TextSpan(
              text: 'By logging, you agree to our',
              style: Styles.textStyle18Th),
          TextSpan(text: ' Terms & Conditions', style: Styles.textStyle18F),
          TextSpan(text: ' and ', style: Styles.textStyle18Th),
          TextSpan(text: 'Privacy Policy', style: Styles.textStyle18F),
        ]));
  }
}
