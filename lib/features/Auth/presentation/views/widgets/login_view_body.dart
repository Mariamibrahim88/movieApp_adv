import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_adv/core/utils/functions/show_snack_bar.dart';
import 'package:movie_app_adv/core/utils/functions/spacing.dart';
import 'package:movie_app_adv/core/utils/functions/styles.dart';
import 'package:movie_app_adv/features/Auth/presentation/manager/login_page_cubit/cubit/login_cubit.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/widgets/custom_button.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/widgets/dont_have_an_account_text.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/widgets/forget_password.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/widgets/terms_and_condition_text.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/widgets/text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginInSuccess) {
        showSnackBar(context, 'success', Colors.green);
        GoRouter.of(context).push('/Nav');
      } else if (state is LoginInFailure) {
        showSnackBar(context, state.message, Colors.red);
      }
    }, builder: (context, state) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Form(
              key: context.read<LoginCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome Back',
                    style: Styles.textStyle30,
                  ),
                  verticalSpace(20),
                  const Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: Styles.textStyle18Two,
                  ),
                  verticalSpace(35),
                  CustomTextFormField(
                    textcontroller: context.read<LoginCubit>().emailController,
                    hintText: 'email',
                    obscureText: false,
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                    textcontroller:
                        context.read<LoginCubit>().passwordController,
                    hintText: 'password',
                    obscureText: true,
                  ),
                  verticalSpace(20),
                  const ForgetPassword(),
                  verticalSpace(30),

                  // SizedBox(height: 30),
                  state is LoginInLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 110, 171, 112),
                        ))
                      : CustomButton(
                          text: 'Login',
                          onPressed: () {
                            if (context
                                .read<LoginCubit>()
                                .formKey
                                .currentState!
                                .validate()) {
                              context.read<LoginCubit>().signIn();
                            }
                          }),
                  verticalSpace(20),
                  const TermsAndConditionsTerm(),
                  verticalSpace(40),
                  const DontHaveAnAccount(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
