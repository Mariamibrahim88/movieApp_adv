import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Forget Password?');
      },
      child: Container(
        child: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forget Password?',
            style: Styles.textStyle18Two,
          ),
        ),
      ),
    );
  }
}
