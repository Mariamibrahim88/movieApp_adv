import 'package:flutter/material.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';

class CustomErorrMessage extends StatelessWidget {
  CustomErorrMessage({super.key, this.errorMessage});

  final errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Styles.textStyle18
            .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
