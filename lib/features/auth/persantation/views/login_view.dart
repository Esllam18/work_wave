import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';

import 'package:work_wave/features/auth/persantation/views/widgets/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: LoginForm(
            onPressed: () {
              GoRouter.of(context).pushReplacement(RouteNames.root);
            },
            emailController: emailController,
            passwordController: passwordController,
          ),
        ),
      ),
    );
  }
}
