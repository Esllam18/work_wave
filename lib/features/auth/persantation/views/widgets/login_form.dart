import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/functions/validators.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/core/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: GlobalKey<FormState>(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(97.h),
            CustomText(
              fontFamily: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ).fontFamily,
              txt: 'Login here',
              fontSize: 24.sp,
              color: AppColors.primary,
            ),
            Gap(34.h),
            CustomText(
              txt: 'Welcome back you’ve been missed!',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            Gap(89.h),

            CustomTextormField(
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: AppValidators.validateEmail,
            ),
            Gap(29.h),
            CustomTextormField(
              hint: 'Password',
              obscureText: true,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: AppValidators.validatePassword,
            ),
            Gap(20.h),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: CustomText(
                  txt: 'Forgot your password?',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
            Gap(30.h),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                backgroundColor: AppColors.primary,
                content: CustomText(
                  txt: 'Sign in',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                onPressed: onPressed,
              ),
            ),
            Gap(30.h),
            TextButton(
              onPressed: () => GoRouter.of(context).push(RouteNames.signUp),
              child: CustomText(
                txt: 'Create new account',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff626262),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
