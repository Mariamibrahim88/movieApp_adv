import 'package:flutter/material.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.onPressed});

  String text;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 110, 171, 112),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child:
            Text(text, style: Styles.textStyle18.copyWith(color: Colors.black)),
      ),
    );
  }
}
