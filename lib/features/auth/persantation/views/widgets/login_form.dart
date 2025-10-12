import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/functions/validators.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/utils/responsive_helper.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/core/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.responsive,
    required this.isLoading,
    required this.login,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  // responsive
  final Responsive responsive;
  final bool isLoading;
  final Future<void> Function() login;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(responsive.setWidth(28)),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsive.setHeight(20)),
            CustomText(
              txt: 'Email',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            SizedBox(height: responsive.setHeight(8)),
            CustomTextFormField(
              controller: emailController,
              hint: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email_outlined,
              validator: AppValidators.validateEmail,
            ),
            SizedBox(height: responsive.setHeight(20)),
            CustomText(
              txt: 'Password',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            SizedBox(height: responsive.setHeight(8)),
            CustomTextFormField(
              controller: passwordController,
              hint: 'Enter your password',
              obscureText: true,
              prefixIcon: Icons.lock_outline,
              validator: AppValidators.validatePassword,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: CustomText(
                  txt: 'Forgot Password?',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: responsive.setHeight(15)),
            SizedBox(
              width: double.infinity,
              height: responsive.setHeight(56),
              child: CustomButton(
                backgroundColor: AppColors.primary,
                onPressed: isLoading ? () {} : login,
                content: isLoading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : CustomText(
                        txt: 'Login',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
              ),
            ),
            SizedBox(height: responsive.setHeight(20)),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.setWidth(16),
                  ),
                  child: CustomText(
                    txt: 'OR',
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: responsive.setHeight(20)),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata_rounded, size: 28),
                    label: Text('Google'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: responsive.setHeight(14),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: responsive.setWidth(12)),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.facebook_rounded, size: 24),
                    label: Text('Facebook'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: responsive.setHeight(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: responsive.setHeight(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  txt: "Don't have an account? ",
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
                TextButton(
                  onPressed: () => GoRouter.of(context).push(RouteNames.signUp),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                  ),
                  child: CustomText(
                    txt: 'Sign Up',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
