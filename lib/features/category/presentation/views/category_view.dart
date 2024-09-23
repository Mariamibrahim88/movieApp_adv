import 'package:flutter/material.dart';
import 'package:movie_app_adv/features/category/presentation/views/widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    //  final navCubit = BlocProvider.of<NavCubit>(context);

    return const Scaffold(
      body: CategoryViewBody(),
    );
  }
}
