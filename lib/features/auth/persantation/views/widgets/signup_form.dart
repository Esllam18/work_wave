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

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onPressed,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(82.h),
            CustomText(
              fontFamily: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ).fontFamily,
              txt: 'Create Account',
              fontSize: 24.sp,
              color: AppColors.primary,
            ),
            Gap(34.h),
            CustomText(
              txt: 'Create an account so you can explore all the existing jobs',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            Gap(53.h),

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
              validator: AppValidators.validatePassword,
            ),
            Gap(29.h),
            CustomTextormField(
              hint: 'Confirm Password',
              obscureText: true,
              controller: confirmPasswordController,
              validator: (value) => AppValidators.validateConfirmPassword(
                value,
                passwordController.text,
              ),
            ),

            Gap(53.h),
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
            Gap(40.h),
            TextButton(
              onPressed: () => GoRouter.of(context).push(RouteNames.login),
              child: CustomText(
                txt: 'Already have an account',
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
