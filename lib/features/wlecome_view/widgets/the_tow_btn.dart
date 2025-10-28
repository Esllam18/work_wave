import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/router/route_names.dart';
import 'package:work_wave/core/widgets/custom_button.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class TheTowBtn extends StatelessWidget {
  const TheTowBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          backgroundColor: AppColors.primary,
          content: CustomText(
            txt: 'Login',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          onPressed: () => GoRouter.of(context).push(RouteNames.login),
        ),
        TextButton(
          onPressed: () => GoRouter.of(context).push(RouteNames.signUp),
          child: CustomText(
            txt: 'Register',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff0A0A0A),
          ),
        ),
      ],
    );
  }
}
