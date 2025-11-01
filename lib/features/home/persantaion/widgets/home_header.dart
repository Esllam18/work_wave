import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              txt: 'Welcome to Jobseek!',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.accent,
            ),
            CustomText(
              txt: 'Discover Jobs 🔥',
              color: AppColors.primary,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        Stack(
          children: [
            CircleAvatar(radius: 30, child: Image.asset(AppImages.ellipse4)),
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 9.r,
                backgroundColor: Colors.white,

                child: CircleAvatar(radius: 5.r, backgroundColor: Colors.red),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
