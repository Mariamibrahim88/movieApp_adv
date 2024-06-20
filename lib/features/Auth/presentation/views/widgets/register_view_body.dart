import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_adv/core/utils/functions/show_snack_bar.dart';
import 'package:movie_app_adv/core/utils/functions/spacing.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';
import 'package:movie_app_adv/features/Auth/presentation/manager/register_page_cubit/register_cubit_cubit.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/widgets/custom_button.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/widgets/have_an_account.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/widgets/text_form_field.dart';

class RigesterViewBody extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var ageController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  RigesterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
        listener: (context, state) {
      if (state is RegisterCubitSuccess) {
        ShowSnackBar(
          context,
          'Success',
          const Color.fromARGB(255, 110, 171, 112),
        );
      } else if (state is RegisterCubitFailure) {
        ShowSnackBar(context, state.message, Colors.red);
      }
    }, builder: (context, state) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Account',
                    style: Styles.textStyle30,
                  ),
                  verticalSpace(20),
                  const Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: Styles.textStyle18Two,
                  ),
                  verticalSpace(35),
                  CustomTextFormField(
                    hintText: 'name',
                    obscureText: false,
                    textcontroller: nameController,
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                    hintText: 'email',
                    obscureText: false,
                    textcontroller: emailController,
                  ),

                  verticalSpace(20),
                  CustomTextFormField(
                    textcontroller: passwordController,
                    hintText: 'password',
                    obscureText: true,
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                    hintText: 'age',
                    obscureText: false,
                    textcontroller: ageController,
                  ),
                  // const ForgetPassword(),
                  verticalSpace(30),
                  state is RegisterCubitLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 110, 171, 112),
                        ))
                      : CustomButton(
                          text: 'Register',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<RegisterCubit>().signUp(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text,
                                    int.parse(ageController.text),
                                  );
                            }
                          },
                        ),

                  verticalSpace(30),
                  const HaveAnAccount(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
